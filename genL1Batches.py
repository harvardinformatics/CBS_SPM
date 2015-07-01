#!/usr/bin/env python

import os
import re
import glob
import platform
import argparse
import datetime

errorlog = ''
        
def main():
    global errorlog
    parser = argparse.ArgumentParser(description='Generate new SPM Level 1 batch files from a template.')
    parser.add_argument('-t','--template', help='Template batch file', required=True)
    parser.add_argument('-p','--path', help='Path to subjects', required=True, nargs=1)
    parser.add_argument('-s','--subjects', help='List of subjects', required=False, nargs='*')
    parser.add_argument('-f','--subjectfile', help='File containing subjects', required=False)
    args = vars(parser.parse_args())

    f = open(args["template"])
    origtemplate = f.read()
    finalname = 'preproc.m'
    finalname = os.path.basename(args["template"])
    f.close()

    spath = args["path"][0]

    # remove a trailing slash if it's there
    if spath[-1]=='/':
        spath = spath[0:-1]

    if args["subjects"]:
        sublist = args["subjects"]
    elif args["subjectfile"]:
        fsf = open(args["subjectfile"],'r')
        sublist = []
        for l in fsf:        
            sublist.append(l.strip())
        fsf.close()

    runSet = set()
    for x in re.findall('.*run(\d+)',origtemplate):
        runSet.add(int(x))
    nOrigRuns = max(runSet)
    epiList = re.findall('.*run\d+-(\d+)',origtemplate)
    nPts = reduce(max,map(int,epiList))
    origPath = re.findall('(/.*)/preproc/',origtemplate)[0]

    generatedBatches = []
    for s in sublist:
        print "\nProcessing subject: "+s+'\n'
        destPath = spath+'/'+s
        subRunList = getRuns(spath, s)
        subRuns = max(subRunList)
        subPts = getNumPts(spath,s)
        rmSPM(spath,s)
        if not runSet.issubset(subRunList):
            errorlog+="Template runs "+ str(runSet) +" is not a subset of subject "+ s + " runs " + str(set(subRunList))
            break
        if subPts != nPts:
            errorlog+="Subject "+ s +" has " + str(subPts) + " points, not " + str(nPts) + " points.\n"
            break
        
        # do string replacements in template .m file
        jobfile = origtemplate.replace(origPath, destPath)
        for run in range(1, subRuns + 1):
            print "Run %s" % run
            condition_dir =  os.path.join(destPath, "analysis", "paradigms", "run%03d" % run)
            condition_files = glob.glob(os.path.join(condition_dir, "*.txt"))
            condition_files = [os.path.basename(x) for x in condition_files]
            conditions = [x.replace(".txt", "") for x in condition_files]
            for condition in conditions:
                condition_file = os.path.join(condition_dir, "%s.txt" % condition)
                with open(condition_file) as fo:
                    onsets = fo.read()
                jobfile = replaceonsets(jobfile, run, condition, onsets)
        
        # write output job file
        jobfile_name = os.path.join(destPath, "batch", finalname)
        generatedBatches.append(jobfile_name)
        with open(jobfile_name, "wb") as fo:
            fo.write(jobfile)

    errfile = spath + "/errors_L1" + datetime.datetime.now().strftime("%Y_%m_%d_%Hh_%Mm")
    if len(errorlog)>0:
        fe = open(errfile,'w+')
        for err in errorlog.split('\n'):
            fe.write(err)
        fe.close()

    for gb in generatedBatches:
        bsubcmd = "bsub -e " + errfile
        bsubcmd = bsubcmd + " -o " + os.path.dirname(gb) + "/../output_files/output_L1" 
        bsubcmd = bsubcmd + datetime.datetime.now().strftime("%Y_%m_%d_%Hh_%Mm")
        bsubcmd = bsubcmd + " -q ncf"
        bsubcmd = bsubcmd + ' matlab -nodisplay -r \"runSPMBatch(\'' + gb + '\')\"'
        print "\nRunning bsub as follows:\n"
        print bsubcmd
        print '\n'
        #os.system(bsubcmd)
        
    print errorlog

def replaceonsets(jobfile, run, condition, onsets):
    pattern  = "(.*matlabbatch\{1\}.spm.stats.fmri_spec.sess\(%s\).cond\(\d\).name = '%s';\n"
    pattern += "matlabbatch\{1\}.spm.stats.fmri_spec.sess\(%s\).cond\(\d\).onset = ).*?;(.*)"
    pattern = pattern % (run, condition, run)
    return re.sub(pattern, r"\1[%s];\2" % onsets, jobfile, flags=re.DOTALL)

def rmSPM(spath,s):
    spmfiles = glob.glob(spath+'/'+s+'/analysis/SPM.mat')
    for fname in spmfiles:
        print "\nRemoving " + fname + '\n'
        os.system('rm ' + fname)

def getRuns(spath,s):
    fruns = glob.glob(spath+'/'+s+'/preproc/*run*')
    maxruns = 0   
    runs = [] 
    for fname in fruns:
        m = re.match('.*run(\d+)',fname)
        runs.append(int(m.group(1)))
    return runs

def getNumPts(spath,s):
    global errorlog    
    fruns = glob.glob(spath+'/'+s+'/preproc/*run*')
    #print 'glob:' + spath+'/'+s+'/preproc/*run*'
    nPts = reduce(max,map(lambda x: int(re.search('run\d*-(\d+)',x).group(1)),fruns))
    #print nPts
    nRuns = max(getRuns(spath,s))
    for i in range(1,nRuns+1):
        fruns = glob.glob(spath+'/'+s+'/preproc/*run'+str.zfill(str(i),3)+'*')
        #print 'glob: '+spath+'/'+s+'/preproc/*run'+str.zfill(str(i),3)+'*'
        nPts_i = reduce(max,map(lambda x: int(re.search('run\d*-(\d+)',x).group(1)),fruns))
        if nPts_i != nPts:
            errorlog = errorlog+"Subject " +s+ " has mismached numbers of points"
            return None
    return nPts
 
if __name__ == "__main__":
    main()

