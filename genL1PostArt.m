% 
% CBS SPM preprocessing batch package -- Template Overwrite Script
% Created by Caitlin Carey
%
% function genL1PostArt(base_dir,subjects,batchnames)
% 
%--------------------------------------------------------------------------
function genL1PostArt(base_dir,subjects,batchnames)

if ~iscell(batchnames)
    error('Please enter the batchnames as a cell array.')
end

dt = datestr(now,'yyyy_mm_dd_HHMM');    
    
nSub = length(subjects);
for s = 1:nSub
    subjectDir = [base_dir '/' subjects{s}];
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
    
    fcontents = regexprep(fcontents,'rp_f-(.*).txt','art_regression_outliers_and_movement_swrf-$1.mat');
    
    runstrs = regexp(fcontents,'sess\((\d)\)','tokens');
    nRuns = -1;
    for i = 1:length(runstrs)
        if ~isempty(runstrs{i})
            nRuns = max(nRuns,str2double(runstrs{i}{1}{1}));
        end
    end
        
    % replace the regression coefficients
    fcontents = regexprep(fcontents,'rp_f-(.*).txt','art_regression_outliers_and_movement_swrf-$1.mat');
    
    % replace the analysis directory
    fcontents = regexprep(fcontents,'matlabbatch\{1\}\.spm\.stats\.fmri_spec\.dir = \{(.*)/analysis','matlabbatch{1}.spm.stats.fmri_spec.dir = {$1/art_analysis/');
    
    % how many zeros will be added
    zeropad = zeros(1,nRuns);
    
    for i = 1:nRuns
        loadstr = ['load ' base_dir '/' subjects{s} '/preproc/' sprintf('art_regression_outliers_swrf-run%03d-001.mat',i)];
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
