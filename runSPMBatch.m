% This function takes a SPM batch file and executes it.
function runSPMBatch(batchname)
try
    spm('defaults', 'FMRI');
    spm_jobman('initcfg')
catch err
    m = err.message;
    error([10 datestr(now) 10 'Could not initialize SPM.' 10 m 10])
end

try
    [bpath, bname, bext] = fileparts(batchname);
    cd(bpath)
    eval(bname)
catch err
    m = err.message;
    errmsg = [10 datestr(now) 10 'File could not be loaded:' 10 batchname 10 m 10];
    error(errmsg)
end

try
    spm_jobman('run', matlabbatch);
catch err
    m = err.message;
    error([10 datestr(now) 10 'Batch could not be run:' 10 batchname 10 m 10])
end
end