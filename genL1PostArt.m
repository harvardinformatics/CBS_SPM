% 
% CBS SPM preprocessing batch package -- Template Overwrite Script
% Created by Caitlin Carey
%
% This script overwrites filler variables generated by the template script.
%
%--------------------------------------------------------------------------
function genL1PostArt(base_dir,subjects,batchnames)

nSub = length(subjects);
for s = 1:nSub
    fname = [base_dir '/' subjects{s} '/batch/' batchnames{s}];
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
    
    runstrs = regexp(fcontents,'sess{(\d)}','tokens');
    nRuns = -1;
    for i = 1:length(runstrs)
        if ~isempty(runstrs{i})
            nRuns = max(nRuns,str2double(runstrs{i}{1}{1}));
        end
    end
    
    % replace the regression coefficients
    fcontents = regexprep(fcontents,'rp_f-(.*).txt','art_regression_outliers_and_movement_swrf-$1.mat');
    
    % how many zeros will be added
    zeropad = zeros(1,nRuns);
    
    for i = 1:nRuns        
        loadstr = ['load ' base_dir '/' subjects{s} '/preproc/' sprintf('art_regression_outliers_and_movement_swrf-run%03d-001.mat',i)];
        eval(loadstr)
        zeropad(i) = size(R,2);
    end
    
    % add in the zero paddings for consess
    consess_matches = regexp(fcontents,'tcon\.convec = ','split');
    consess_str = '';
    ind = 0;
    while (length(consess_str) ~= 0)
        ind = ind+1;
        if length(consess_matches{ind})==2
            consess_str = conses_matches{ind}{2};
        end
    end
    digitre = '(\d\.?\d*\s?)';
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
    %
    fid = fopen([fname(1:end-2) '_art.m'],'w+');
    for i = 1:length(fcontents)
        fprintf(fid,[fcontents{i} '\n']);
    end
    fclose(fid);
end
