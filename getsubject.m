function [] = getsubject(subjectid,boldruns,structrun,fmruns,destpath,analysisdirs,usesingle,dicompath)
%GETSUBJECT   Get subject data from the network and convert to spm. 
%   GETSUBJECT(subjectid, boldruns, structrun,fmruns,destpath[,dicompath]) downloads
%   data using cbsget, processes it with spm and renames the files and
%   puts them in an ordered directory structure.
%
%   subjectid:  the name of the subject in CBSCentral (in single quotes, e.g. 'my_subj_name')
%   boldruns:   the run numbers for the BOLD scans (in brackets if more than one run, e.g. 1 or [1,2])
%   structrun:  the run number for the structural scan (same as boldruns)
%   fmruns:     the run numbers for the fieldmap scan (same as boldruns)
%               The fieldmap is optional. If you don't have one, put empty brackets, e.g. []
%
%   destpath:   the path where this data will go after conversion (in signle quotes, e.g. '/users/me/data')
%   dicompath:  the path to dicoms, in the event that you don't want to run
%               cbsget, but you do have the dicoms already unzipped in a folder.

%% Do error checking on the inputs




% Has this been run before?
dircontents = dir([destpath '/' subjectid]);
%now checkedin python script
% if length(dircontents)~=0
%     error([destpath '/' subjectid ' appears to have contents.  Please pull data to a location with no contents to avoid file collisions.'])
% end

% Get current wd
startingwd = pwd;

% Keep track of the directories we create
newdirs = {};

%% If we're not using cbs_get, copy the files
if ~isempty(dicompath)
    disp('Not running cbsget: copying files instead')
    [status result] = system(['mkdir ' fullfile(destpath,subjectid)]);
    if status~=0
        error(['getsubject could not be run successfully!  The subject directory may already exist.' 10 result])
    end
    newdirs{end+1} = fullfile(destpath,subjectid);

    [status result] = system(['mkdir ' fullfile(destpath,subjectid,'RAW')]);
    if status~=0
        rmdirs(newdirs)
        error(['getsubject could not be run successfully, is the path correct?' 10 result])
    end
    newdirs{end+1} = fullfile(destpath,subjectid,'RAW');
    disp('Copying files as follows:')
    cpcmd = ['cp ' dicompath '/* ' fullfile(destpath,subjectid,'RAW')];
    disp(cpcmd);
    [status result] = system(['cp ' dicompath '/* ' fullfile(destpath,subjectid,'RAW')]);
    if status~=0
        rmdirs(newdirs)
        error(['getsubject could not be run successfully!' 10 result])
    end
else
    %% Construct the call to cbs_get
    % An example call is:
    % cbsget -r 4,5,6,7 -s 120418_spmtest
    
    allruns = [boldruns structrun fmruns];
    
    runstr = '';
    for runnum = 1:length(allruns)
        runstr = [runstr num2str(allruns(runnum)) ','];
    end
    
    % remove the last extraneous comma
    runstr = runstr(1:end-1);
    
    %cbscmd = ['cbsget -r ' runstr ' -s ' subjectid];
     cbscmd = ['ArcGet.py -a cbscentral -r ' runstr ' -s ' subjectid ' -o ' destpath];
    
    disp('Running ArcGet as follows:')
    disp(cbscmd)
    
    [status,result] = system(cbscmd);
    
    if status~=0
        rmdirs(newdirs)
        error(['ArcGet could not be run successfully, make sure your config file is set up correctly and the MR session ID is correct!' 10 result])
    end
    
    %%  Unzip the files to the specified directory
    
    %unzipcmd = ['unzip ' subjectid '.zip -d ' destpath];
    %disp('Unzipping data as follows:')
    %disp(unzipcmd)
    
    %[status,result] = system(unzipcmd);
    
    %if status~=0
       % rmdirs(newdirs)
       % error(['DICOM archive could not be unzipped successfully!' 10 result])
   %end
    lscmd = ['ls ' destpath '/' subjectid '/RAW'];
    disp('listing RAW directory:')
    disp(lscmd)
    
    [status,result] = system(lscmd);
    
    if status~=0
       % rmdirs(newdirs)
        error(['Raw directory not successfully created!' 10 result])
   end
    
    disp('...complete!')
end

%% Create the directory structure 

dirnames = {analysisdirs{1,:},'batch','preproc','output_files'};

for d = 1:length(dirnames)
    
    mkcmd = ['mkdir ' destpath '/' subjectid '/' dirnames{d}];
    
    disp('Making new directory as follows:')
    disp(mkcmd)
    [status,result] = system(mkcmd);
    
    if status~=0
        rmdirs(newdirs)
        error(['mkdir command could not be run successfully!' 10 result])
    end
    newdirs{end+1} = [destpath '/' subjectid '/' dirnames{d}];
    
end
for d = 1:length(analysisdirs)    
    mkcmd = ['mkdir ' destpath '/' subjectid '/' analysisdirs{d} '/paradigms'];

    disp('Making new directory as follows:')
    disp(mkcmd)
    [status,result] = system(mkcmd);

    if status~=0
        rmdirs(newdirs)
        error(['mkdir command could not be run successfully!' 10 result])
    end

    
    newdirs{end+1} = [destpath '/' subjectid '/' analysisdirs{d} '/paradigms'];
end

%% Run spm convert on the files

disp('Converting files to SPM format...')
cd(fullfile(destpath,subjectid,'RAW'))
dicom_files = spm_select('list',fullfile(destpath,subjectid,'RAW'),'.dcm');
disp(['Number of DICOMs: ' num2str(length(dicom_files))])
hdrs = spm_dicom_headers(dicom_files);
if str2num(usesingle)
    spm_dicom_convert(hdrs,'all','flat','nii')
else
    spm_dicom_convert(hdrs,'all');    
end
disp('...complete!')

%% Rename hdr and img files to smaller pathnames

for b = 1:length(boldruns)
    disp('Moving Bold Runs...')
    runstr = sprintf('%04d',boldruns(b));
    newrunstr = sprintf('%03d',b);
    % also make sub-directories for the paradigms
    for d = 1:length(analysisdirs)
        mkcmd = ['mkdir ' destpath '/' subjectid '/' analysisdirs{d} '/paradigms/run' newrunstr];
    
        disp('Making new directory as follows:')
        disp(mkcmd)
        [status,result] = system(mkcmd);
    
        if status~=0
            rmdirs(newdirs)
            error(['mkdir command could not be run successfully!' 10 result])
        end
        newdirs{end+1} = [destpath '/' subjectid '/' analysisdirs{d} '/paradigms/run' newrunstr];
    end
    
    bruns = dir([destpath '/' subjectid '/RAW/*' runstr '-*-*-*']);
    if (length(bruns)<1)
        rmdirs(newdirs)
        error(['No dicoms found for run ' runstr ' - did SPM provide warning messages?'])
    end
    for br = 1:length(bruns)
        brname = bruns(br).name;
        parsed = regexp(brname,'-','split');
        newname = ['f-run' newrunstr '-' sprintf('%03d',str2num(parsed{3})) brname(end-3:end)];
        cmdname = ['mv ' destpath '/' subjectid '/RAW/' brname ' ' destpath '/' subjectid '/preproc/' newname];
        [status,result] = system(cmdname);
    
        if status~=0
            rmdirs(newdirs)
            error(['File could not be moved!' 10 result])
        end
        
    end
end

disp('...complete!')


disp('Moving Structural Run...')
runstr = sprintf('%03d',structrun(1));
srun = dir([destpath '/' subjectid '/RAW/*' runstr '-*-*-*']);
for sr = 1:length(srun)
    srname = srun(sr).name;
    newname = ['s-struct' srname(end-3:end)];
    cmdname = ['mv ' destpath '/' subjectid '/RAW/' srname ' ' destpath '/' subjectid '/preproc/' newname];
    [status,result] = system(cmdname);
    
    if status~=0
        rmdirs(newdirs)
        error(['File could not be moved!' 10 result])
    end
end

disp('...complete!')

if length(fmruns)==2
    disp('Moving Field Maps...')
    % magnitude
    runstr = sprintf('%03d',fmruns(1));
    mrun = dir([destpath '/' subjectid '/RAW/*' runstr '-*-*-*']);
    for mr = 1:length(mrun)
        mrname = mrun(mr).name;
        newname = ['s-fieldmap_mag-' mrname(end-5:end)];
        cmdname = ['mv ' destpath '/' subjectid '/RAW/' mrname ' ' destpath '/' subjectid '/preproc/' newname];
        [status,result] = system(cmdname);
        
        if status~=0
            rmdirs(newdirs)
            error(['File could not be moved!' 10 result])
        end
    end
    % phase
    runstr = sprintf('%03d',fmruns(2));
    mrun = dir([destpath '/' subjectid '/RAW/*' runstr '-*-*-*']);
    for mr = 1:length(mrun)
        mrname = mrun(mr).name;
        newname = ['s-fieldmap_phase' mrname(end-3:end)];
        cmdname = ['mv ' destpath '/' subjectid '/RAW/' mrname ' ' destpath '/' subjectid '/preproc/' newname];
        [status,result] = system(cmdname);
        
        if status~=0
            rmdirs(newdirs)
            error(['File could not be moved!' 10 result])
        end
    end    
    disp('...complete!')
end

%% Archive the original files

origfiles = dir([destpath '/' subjectid '/RAW/*']);

thisdir = pwd();
cd([destpath '/' subjectid '/RAW/']);
tgzcmd = ['tar -cvzf ' destpath '/' subjectid '/RAW/' subjectid '.tar.gz '  '*'];


disp('Rearchiving data as follows:')
disp(tgzcmd)
[status,result] = system(tgzcmd);

if status~=0
    rmdirs(newdirs)
    error(['DICOM archive could not be created successfully!' 10 result])
end

disp('Complete!')

cd(thisdir)

disp('Removing uncompressed files...')

myfiles = dir([destpath '/' subjectid '/RAW/']);

tgzname = [subjectid '.tar.gz'];

for i = 1:length(myfiles)    
    if strcmp(myfiles(i).name,tgzname)
        % do nothing
    elseif strcmp(myfiles(i).name,'.')
        % do nothing
    elseif strcmp(myfiles(i).name,'..')
        % do nothing
    else
        rmcmd = ['rm ' destpath '/' subjectid '/RAW/' myfiles(i).name];

        [status,result] = system(rmcmd);

        if status~=0
           warning(['File could not be removed!' 10 result])
        end
    end
end


if ~exist('dicompath')
    %disp('Removing zip file from CBS...')
    
    cd(startingwd)
    
    %rmcmd = ['rm ' subjectid '.zip'];
    
    %[status,result] = system(rmcmd);
    
    %if status~=0
     %   rmdirs(newdirs)
     %   error(['Original zip file could not be removed!' 10 result])
    %end
    
    
    disp('...Complete!')
end

disp('********************************************************')
disp('*                    Thank You!                        *')
disp('********************************************************')

end

function [] = rmdirs(dirarray)

disp('Removing top level directory...' )
disp(dirarray(1))
rmcmd = ['rm -r ' dirarray{1}];

[status,result] = system(rmcmd);

if status~=0
    warning(['Directory could not be removed!' 10 result])
end

% disp('Removing created directories...')
% for i = 1:length(dirarray)
%         rmcmd = ['rm -r ' dirarray{i}];
% 
%         [status,result] = system(rmcmd);
% 
%         if status~=0
%            warning(['Directory could not be removed!' 10 result])
%         end    
% end
end
