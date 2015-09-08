#!/usr/bin/env python

import os
import sys
import pdb
import logging
import argparse
import datetime as dt
import subprocess as sp

logger = logging.getLogger(os.path.basename(__file__))
logging.basicConfig(level=logging.INFO)

def main():
    parser = argparse.ArgumentParser(description="Download a single SPM subject and set up the correct directory structure")
    parser.add_argument("-p", "--destpath", required=True, 
        help="the path where this data will go after conversion (e.g. /users/me/data)")
    parser.add_argument("-s", "--subjectid", required=True, 
        help="the name of the subject in CBSCentral")
    parser.add_argument("-b", "--boldruns", required=True, nargs="+",
        help="the run numbers for the BOLD scans (e.g. 1 or 1 2 3 4)")
    parser.add_argument("-t", "--structrun", required=True,
        help="the run number for the structural scan")
    parser.add_argument("-m", "--fieldmap",
        help="the run numbers for the fieldmap scans (if present, the two runs, e.g. 6 7)", nargs=2)
    parser.add_argument("-d", "--dicompath", default='',
        help="the path to dicoms, in the event that you don't want to  cbsget, but you do have the dicoms already unzipped in a folder.")
    parser.add_argument("-n", "--nii", action="store_true", 
        help="use single file NIfTI format (.nii) outputs")
    parser.add_argument("--vmem", default=1024,
        help="Virtual memory required, needed if using sbatch")
    parser.add_argument("--time", default="0-2:00", 
        help="Time limit for analysis, see FAQ, needed if using sbatch")
    parser.add_argument("--analysis-dir", default=["analysis"], nargs='+',
        help="Analysis directory, just name, if want something other than subjectid/analysis")
    parser.add_argument("--run-with", choices=["sbatch", "bsub", "dry"], default="sbatch", 
        help="Run batch with either sbatch (slurm), bsub (lsf), or dry (just make new batch script but don't run)")
    parser.add_argument("--debug", action="store_true")
    args = parser.parse_args()

    if args.debug:
        logger.setLevel(logging.DEBUG)

    # check --destpath
    args.destpath = os.path.expanduser(args.destpath)
    if not os.path.exists(args.destpath):
        logger.critical("--destpath does not exist")
        sys.exit(1)
    
    # check --dicompath
    if args.dicompath:
        args.dicompath = os.path.expanduser(args.dicompath)
        if not os.path.exists(args.dicompath):
            logger.critical("--dicompath does not exist")
            sys.exit(1)
    fullpath = os.path.join(args.destpath, args.subjectid)
    if os.path.exists(fullpath):
        logger.critical("--subjectid already exisits, please delete or specifiy new location")
        sys.exit(1)
    # subjectid:  the name of the subject in CBSCentral (in single quotes, e.g. 'my_subj_name')
    # boldruns:   the run numbers for the BOLD scans (in brackets if more than one run, e.g. 1 or [1,2])
    # structrun:  the run number for the structural scan (same as boldruns)
    # fmruns:     the run numbers for the fieldmap scan (same as boldruns)
    #             The fieldmap is optional. If you don't have one, put empty brackets, e.g. []

    # destpath:   the path where this data will go after conversion (e.g. /users/me/data)
    # dicompath:  the path to dicoms, in the event that you don't want to run
    #             cbsget, but you do have the dicoms already unzipped in a folder.

    # getsubject(subjectid,boldruns,structrun,fmruns,destpath,analysisdirs, nii, dicompath)
    runcmd = "matlab -nodisplay -nojvm -r \"try; getsubject('%s', [%s], [%s], [%s], '%s', {%s}, '%s', '%s'); catch ME; disp(ME.message); end; exit()\""

    boldruns = "%s" % ",".join(args.boldruns)
    structrun = "%s" % args.structrun
    fieldmap = ''
    if args.fieldmap:
        fieldmap = "%s" % ",".join(args.fieldmap)
    analysisdir = ",".join(["'%s'" % x for x in args.analysis_dir])
    hasnifti = 1 if args.nii else 0
    runcmd = runcmd % (args.subjectid, boldruns, structrun, fieldmap, args.destpath, analysisdir, hasnifti, args.dicompath)
    #logger.info("matlab command: %s" % runcmd)

    timestamp = dt.datetime.now().strftime("%Y_%m_%d_%Hh_%Mm")
    stderr = os.path.join(args.destpath, "errors_getsubj_%s" % timestamp)
    stdout = os.path.join(args.destpath, "output_getsubj_%s_%s" % (args.subjectid, timestamp))

    launch(runcmd, stdout, stderr, args)

def launch(matlab_cmd, stdout, stderr, args):
    if args.run_with == "dry":
        return
    elif args.run_with == "sbatch":
        sbatch = which("sbatch", fail=True)
        cmd = [sbatch, "--partition", "ncf", "--output", stdout, "--error", stderr, 
               "--mem", str(args.vmem), "--time", args.time, "--wrap", matlab_cmd]
    elif args.run_with == "bsub":
        bsub = which("bsub", fail=True)
        cmd = [bsub, "-q", "ncf", "-o", stdout, "-e", stderr, matlab_cmd]
    fullcommand=' '.join(cmd)
    logger.info("executing: \n%s" % fullcommand)

    output = sp.check_output(cmd)
    logger.info("job handler response: \n%s" % output)

def which(c, fail=False):
    for p in os.environ["PATH"].split(':'):
        c_ = os.path.join(p, c)
        if os.path.exists(c_):
            return c_
    if fail:
        logger.critical("%s not found" % c)
        sys.exit(1)
    return None

if __name__ == "__main__":
    main()

