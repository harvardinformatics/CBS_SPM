#!/usr/bin/env python

import os
import re
import sys
import pdb
import glob
import logging
import argparse
import datetime as dt
import subprocess as sp

logger = logging.getLogger(os.path.basename(__file__))
logging.basicConfig(level=logging.INFO)

def main():
    parser = argparse.ArgumentParser(description="Generate SPM Level 1 batch file from template")
    parser.add_argument("-t", "--template", required=True,
        help="Template batch file")
    parser.add_argument("-p", "--path", required=True, 
        help="Path to subjects")
    parser.add_argument("--vmem", default=1024, 
        help="Virtual memory required")
    parser.add_argument("--time", default="0-2:00",
        help="Time limit for analysis, see FAQ")
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("-s", "--subjects", 
        nargs='*', help="List of subject IDs seperated by spaces")
    group.add_argument("-f", "--subject-file", 
        help="File containing subject IDs, each one on a new line")
    parser.add_argument("--run-with", choices=["sbatch", "bsub", "dry"], default="sbatch",
        help="Run batch with either sbatch (slurm), bsub (lsf), or dry (just make new batch script but don't run)")
    parser.add_argument("-d", "--debug", action="store_true",
        help="Enable debug messages")
    args = parser.parse_args()

    # enable logger debug messages
    if args.debug:
        logger.setLevel(logging.DEBUG)

    # expand tildes in file names
    args.template = os.path.expanduser(args.template)
    if not os.path.exists(args.template):
        logger.critical("--template does not exist")
        sys.exit(1)
    args.path = os.path.expanduser(args.path)
    if not os.path.exists(args.path):
        logger.critical("--path does not exist")
        sys.exit(1)
    
    # output file name
    outputfname = os.path.basename(args.template)

    # read in the spm template
    with open(args.template, "rb") as fo:
        template = fo.read()

    # build subject list
    subject_list = []
    if args.subjects:
        subject_list = args.subjects
    elif args.subject_file:
        with open(os.path.expanduser(args.subject_file), "rb") as fo:
            for line in fo:
                subject_list.append(line.strip())
    
    # get a set of runs from the template
    Runs = set()
    for run in re.findall(".*run(\d+)", template):
        Runs.add(int(run))

    # get the number of EPIs from the template
    epilist = re.findall(".*run\d+-(\d+)", template)
    epilist = [int(x) for x in epilist]
    NumPoints = max(epilist)
    
    # get the original path from template
    origpath = re.findall("(/.*)/preproc/", template)[0]

    # generate batch files for each subject
    newbatchlist = []
    for subject in subject_list:
        logger.info("processing subject=%s" % subject)
        destpath = os.path.join(args.path, subject)
        runs = getruns(args.path, subject)
        numpoints = getnumpoints(args.path, subject, max(runs))
        if not Runs.issubset(runs):
            logger.critical("template runs %s is not a subset of %s runs %s" % (Runs, subject, runs))
            sys.exit(1)
        if numpoints != NumPoints:
            logger.critical("%s has %s points instead of %s" % (subject, numpoints, NumPoints))
            sys.exit(1)
        # do string replacements in template file (copy)
        batchfile = template.replace(origpath, destpath)
        
        # write output job file
        #fname = os.path.join("/users", "tokeefe", outputfname)
        fname = os.path.join(destpath, "batch", outputfname)
        newbatchlist.append(fname)
        with open(fname, "wb") as fo:
            fo.write(batchfile)

    # submit jobs
    timestamp = dt.datetime.now().strftime("%Y_%m_%d_%Hh_%Mm")
    stderr = os.path.join(args.path, "errors_preproc_%s" % timestamp) 
    for batch in newbatchlist:
        stdout = os.path.join(os.path.dirname(batch), "..", "output_files", "output_preproc_%s" % timestamp)
        stdout = os.path.realpath(stdout)
        matlab_cmd = "matlab -nojvm -nodisplay -r \"runSPMBatch('%s')\"" % batch
        launch(matlab_cmd, stdout, stderr, args)

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
    logger.debug("executing: %s" % cmd)
    output = sp.check_output(cmd)
    #logger.debug(output)

def which(c, fail=False):
    for p in os.environ["PATH"].split(':'):
        c_ = os.path.join(p, c)
        if os.path.exists(c_):
            return c_
    if fail:
        logger.critical("%s not found" % c)
        sys.exit(1)
    return None

def getruns(path, subject):
    pattern = os.path.join(path, subject, "preproc", "*run*") 
    files = glob.glob(pattern)
    runs = set()
    for f in files:
        runs.add(int(re.match(".*run(\d+)", f).group(1)))
    return runs

def getnumpoints(path, subject, nruns):
    pattern = os.path.join(path, subject, "preproc", "*run*")
    files = glob.glob(pattern)
    # get the maximum number of time points
    npts = []
    for f in files:
        npts.append(int(re.search("run\d*-(\d+)", f).group(1)))
    NumPts = max(npts)
    # detect any mismatched time points
    for run in range(1, nruns + 1):
        pattern = os.path.join(path, subject, "preproc", "*run%03d*" % run)
        files = glob.glob(pattern)
        runpts = []
        for f in files:
            runpts.append(int(re.search("run\d*-(\d+)", f).group(1)))
        RunPts = max(runpts)
        if RunPts != NumPts:
            raise TimepointError("subject %s has mismatched time points" % subject)
    return NumPts

class TimepointError(Exception):
    pass

if __name__ == "__main__":
    main()

