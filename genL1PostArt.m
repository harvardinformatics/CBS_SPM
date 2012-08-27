% 
% CBS SPM preprocessing batch package -- Template Overwrite Script
% Created by Caitlin Carey
%
% function genL1PostArt(base_dir,subjects,batchname,useMovement)
%
% Example call:
% genL1PostArt('/ncf/snp/06/SPAA/CBS/MID_analysis_art',{'subject1','subject2','subject3'},{'myLevel1Batch.m'},TRUE)
%--------------------------------------------------------------------------
function genL1PostArt(base_dir,subjects,batchnames,useMovement)

if ~iscell(batchnames)
    error('Please enter the batchnames as a cell array.')
end

dt = datestr(now,'yyyy_mm_dd_HHMM');    

if ~iscell(subjects)
    subfile = subjects;
    fid = fopen(subfile,'r');
    if fid==-1
        error(['Subject list file does not exist:' 10 subfile])
    end
    subjects = {};
    while 1
        tline = fgetl(fid);
        if ~ischar(tline), break, end
        subjects{end+1} = tline;
    end
    fclose(fid);
end

nSub = length(subjects);
for s = 1:nSub
    subjectDir = [base_dir '/' subjects{s}];
        
    
    loadstr = ['load ' base_dir '/' subjects{s} '/preproc/' sprintf('art_regression_outliers_and_movement_swrf-run%03d-001.mat',i)];

    
    try
        [foo bar] = system(['rm ' subjectDir '/art_analysis/SPM.mat']);
        disp(['Removed SPM.mat in art_analysis directory for ' subjects{s}]);
    end
    
    if length(batchnames)==1
        fname = [base_dir '/' subjects{s} '/batch/' batchnames{1}];
    else
        fname = [base_dir '/' subjects{s} '/batch/' batchnames{s}];
    end
    fid = fopen(fname);
    % put each line of the original file into fcontents
    fcontents = {};
    tline = fgetl(fid);   
    while ischar(tline)
        fcontents{end+1} = tline;
        tline = fgetl(fid);
    end    
    fclose(fid);
           
    
    runstrs = regexp(fcontents,'sess\((\d)\)','tokens');
    nRuns = -1;
    for i = 1:length(runstrs)
        if ~isempty(runstrs{i})
            nRuns = max(nRuns,str2double(runstrs{i}{1}{1}));
        end
    end
    
    preprocDir = [subjectDir '/' preprocDir];
    
    % construct the outlier and movement files without the composite
    
    for i = 1:nRuns
        mvmtstr = sprintf('*f-run%03d*.txt',i);
        fnames = dir(mvmtstr);
        movement = load(fnames.name);
        outliers = load(['art_regression_outliers_swrf-run' sprintf('%03d',i) '-001.mat']);
        
        R = [outliers.R movement];
        system(['cp art_regression_outliers_and_movement_swrf-run' sprintf('%03d',i) '-001.mat ' 'art_regression_outliers_and_movement_composite_swrf-run' sprintf('%03d',i) '-001.mat']);
        save(['art_regression_outliers_and_movement_swrf-run' sprintf('%03d',i) '-001.mat'],'R');
    end
    
    
    % replace the regression coefficients
    if useMovement
        fcontents = regexprep(fcontents,'rp_f-(.*).txt','art_regression_outliers_and_movement_swrf-$1.mat');
    else
        fcontents = regexprep(fcontents,'rp_f-(.*).txt','art_regression_outliers_swrf-$1.mat');
    end

    
    % replace the analysis directory
    fcontents = regexprep(fcontents,'matlabbatch\{1\}\.spm\.stats\.fmri_spec\.dir = \{(.*)/analysis','matlabbatch{1}.spm.stats.fmri_spec.dir = {$1/art_analysis/');
    
    % how many zeros will be added
    zeropad = zeros(1,nRuns);
    
    for i = 1:nRuns
        if useMovement
            loadstr = ['load ' base_dir '/' subjects{s} '/preproc/' sprintf('art_regression_outliers_and_movement_swrf-run%03d-001.mat',i)];
        else
            loadstr = ['load ' base_dir '/' subjects{s} '/preproc/' sprintf('art_regression_outliers_swrf-run%03d-001.mat',i)];
        end

        eval(loadstr)
        zeropad(i) = size(R,2);
    end
    
    % add in the zero paddings for consess
    consess_matches = regexp(fcontents,'tcon\.convec = ','split');
    consess_str = '';
    ind = 0;
    useF = false;
    while (isempty(consess_str))
        ind = ind+1;
        if ind>length(consess_matches)
            disp('No tcon.convec lines found: using F contrast instead.')
            useF = true;
            break
        end
        if length(consess_matches{ind})==2
            consess_str = consess_matches{ind}{2};
        end
    end
    
    if useF
        insideF = false;
        for linenum = 1:length(fcontents)
            strloc = strfind(fcontents{linenum},'fcon.convec');
            endloc = strfind(fcontents{linenum},';');
            if strloc
                insideF = true;
            elseif endloc
                insideF = false;
            end
            if insideF
                consess_str = fcontents{linenum};
            end
        end
    end
    
    if isempty(consess_str)
        disp('No F contrast found.  No additional zeros will be added to contrast vectors.')
    else
        
        digitre = '(-?\d\.?\d*\s?)';
        nDigits = length(regexp(consess_str,digitre));
        nPreserve = nDigits/nRuns;
        
        replacere = ['tcon\.convec = ['];
        findre = replacere;
        for i = 1:nRuns
            findre = [findre '(' digitre '{' num2str(nPreserve) '})'];
            replacere = [replacere '$' num2str(i) ' ' num2str(zeros(1,zeropad(i))) ' '];
        end
        fcontents = regexprep(fcontents,findre,replacere);
        
        
        % add in the zero paddings for f contrast
        
        replacere = [''];
        findre = replacere;
        for i = 1:nRuns
            findre = [findre '(' digitre '{' num2str(nPreserve) '})'];
            replacere = [replacere '$' num2str(i) ' ' num2str(zeros(1,zeropad(i))) ' '];
        end
        fcontents = regexprep(fcontents,findre,replacere);
        
        insideF = false;
        for linenum = 1:length(fcontents)
            strloc = strfind(fcontents{linenum},'fcon.convec');
            endloc = strfind(fcontents{linenum},';');
            if strloc
                insideF = true;
            elseif endloc 
                insideF = false;
            end
            if insideF
                fcontents{linenum} = regexprep(fcontents{linenum},findre,replacere);
            end
        end
    end
    % write out the updated file
    fid = fopen([fname(1:end-2) '_art.m'],'w+');
    for i = 1:length(fcontents)
        try
            fprintf(fid,[fcontents{i} '\n']);
        catch
            keyboard
        end
    end
    fclose(fid);
    disp(['Generated file: ' fname(1:end-2) '_art.m'])
    
    % and submit it!
    [filepath scriptname ext] = fileparts([fname(1:end-2) '_art.m']);
    bsubcmd = ['bsub -e ' base_dir '/errors_L1ART_' dt];
    bsubcmd = [bsubcmd ' -o ' subjectDir '/output_files/output_L1ART'];
    bsubcmd = [bsubcmd dt];
    bsubcmd = [bsubcmd ' -q ncf'];
    bsubcmd = [bsubcmd ' matlab -nodisplay -r ' 34 'runSPMBatch(' 39 filepath filesep scriptname ext 39 ');' 34];
    system(bsubcmd);   
    
end
