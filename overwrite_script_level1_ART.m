% 
% CBS SPM preprocessing batch package -- Template Overwrite Script
% Created by Caitlin Carey
%
% This script overwrites filler variables generated by the template script.
%
%--------------------------------------------------------------------------

fprintf('Overwriting template preproc batch for %s %s\n',type,subject);

% these are taken from input
subjectNum = subject;
directoryPre = directory;
taskDir = task;
outFolder = outfold;
subjectType = type;

% creates subject directory path
if (strcmp(subjectType,'NONE'))
    subjectDir = [directoryPre, subjectNum, '/'];
else
    subjectDir = [directoryPre, type, '/', subjectNum, '/'];
end

% here i need to do some checking of the input...like if the analysis
% folder actually exists...
if (exist([subjectDir, outFolder], 'dir') == 0)
    error('ART has not been done yet!');
else
    delete([subjectDir, outFolder, 'SPM.mat']);
    delete([subjectDir, outFolder, '*.img']);
    delete([subjectDir, outFolder, '*.hdr']);
end

% determines number of runs
runs = length(dir([subjectDir,taskDir, 'run*']));
    
%--------------------------------------------------------------------------

% here i'm not sure if the batch numbers change...so we might need to
% finagle this a bit more

% if we dont have the correct number of runs, throw error
if (length(matlabbatch{1}.spm.stats.fmri_spec.sess) ~= runs)
    error('TestRuns:WrongNum','Subject does not have expected number of runs.');
end 

% creates structure of epis for each run
% need to make this more generic...
for i = 1:runs
    try
        fprintf('Grabbing functionals from %s.\n', [subjectDir, taskDir, 'run', num2str(i), '/']);
        epis = strtrim(ls([subjectDir, taskDir, 'run', num2str(i), '/swrf*.img']));
    catch
        fprintf('Could not locate functionals in %s.\n', [subjectDir, taskDir, 'run', num2str(i), '/']);
        rethrow(lasterror());
    end

    % checks that we have the correct number of epis
    originallen = length(matlabbatch{1}.spm.stats.fmri_spec.sess(i).scans);
    functionals = regexp(epis,'\n','split')';
    
    % if not, throw error
    if (length(functionals) ~= originallen)
        error('TestEpis:WrongNum','Subject does not have expected number of epis.');
    end

    % if so, replace template epis
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).scans = functionals;

    try
        regressors = strtrim(ls([subjectDir, taskDir, 'run', num2str(i), '/art_regression_outliers_and_movement*.mat']));
        matlabbatch{1}.spm.stats.fmri_spec.sess(i).multi_reg = {regressors}; 
	tempload = load(regressors);
	outliers(i) = size(tempload.R,2)-6;
    catch
        fprintf('Could not locate regressors in %s.\n', [subjectDir, taskDir, 'run', num2str(i), '/']);
        rethrow(lasterror());
    end

end

contrastlen = length(matlabbatch{3}.spm.stats.con.consess{1}.tcon.convec);
runlength = contrastlen/runs;
numcontrasts = length(matlabbatch{3}.spm.stats.con.consess);

index = 1:runlength:(contrastlen-(runlength-1));

for j = 1:(numcontrasts-1)
	newcontrast = [];
	for i = 1:length(index)
		oldcontrast = matlabbatch{3}.spm.stats.con.consess{j}.tcon.convec;
		runcontrast = oldcontrast(index(i):(index(i)+runlength-1));
		newcontrast = [newcontrast runcontrast zeros(1,outliers(i),1)];
	end
	
	matlabbatch{3}.spm.stats.con.consess{j}.tcon.convec = newcontrast;
	
end
	
fcontrastheight = size(matlabbatch{3}.spm.stats.con.consess{numcontrasts}.fcon.convec{1}, 1);

fconnew = [];
fconn = matlabbatch{3}.spm.stats.con.consess{numcontrasts}.fcon.convec{1};
for i = 1:length(index)
	runcontrast = fconn(:,index(i):(index(i)+runlength-1));
	fconnew = [fconnew,runcontrast,zeros(fcontrastheight,outliers(i))];
matlabbatch{3}.spm.stats.con.consess{numcontrasts}.fcon.convec{1} = fconnew; 
end

% defines new output folder
matlabbatch{1}.spm.stats.fmri_spec.dir = {[subjectDir, outFolder]};