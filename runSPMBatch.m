% This function takes a SPM batch file and executes it.
function runSPMBatch(batchname)
try
    spm('defaults', 'FMRI');
    spm_jobman('initcfg')
catch
    error([datestr(now) 10 'Could not initialize SPM.'])
end

try
    [bpath, bname, bext] = fileparts(batchname);
    cd(bpath)
    eval(bname)
catch
    errmsg = [datestr(now) 10 'File could not be loaded:' 10 batchname];
    error(errmsg)
end

try
    spm_jobman('run', matlabbatch);
catch
    error([datestr(now) 10 'Batch could not be run:' 10 batchname])
end
end