import argparse
import glob,re,os.path,datetime,os

errorlog = ''

def getNumRuns(spath,s):
    fruns = glob.glob(spath+'/'+s+'/preproc/*run*')
    maxruns = 0    
    for fname in fruns:
        m = re.match('.*run(\d+)',fname)
        runnum = int(m.group(1))
        if runnum>maxruns:
            maxruns = runnum
    return maxruns


def getNumPts(spath,s):
    global errorlog    
    fruns = glob.glob(spath+'/'+s+'/preproc/*run*')
    #print 'glob:' + spath+'/'+s+'/preproc/*run*'
    nPts = reduce(max,map(lambda x: int(re.search('run\d*-(\d+)',x).group(1)),fruns))
    #print nPts
    nRuns = getNumRuns(spath,s)
    for i in range(1,nRuns+1):
        fruns = glob.glob(spath+'/'+s+'/preproc/*run'+str.zfill(str(i),3)+'*')
        #print 'glob: '+spath+'/'+s+'/preproc/*run'+str.zfill(str(i),3)+'*'
        nPts_i = reduce(max,map(lambda x: int(re.search('run\d*-(\d+)',x).group(1)),fruns))
        if nPts_i != nPts:
            errorlog = errorlog+"Subject " +s+ " has mismached numbers of points"
            return None
    return nPts
            
        
    
parser = argparse.ArgumentParser(description='Generate new SPM batch files from a template.')
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
    sublist = fsf.split('\n')
    fsf.close()
    
runList = re.findall('.*run(\d+)',origtemplate)
nOrigRuns = reduce(max,map(int,runList))
epiList = re.findall('.*run\d+-(\d+)',origtemplate)
nPts = reduce(max,map(int,epiList))
origPath = re.findall('(/.*)/preproc/',origtemplate)[0]

generatedBatches = []

for s in sublist:
    print "Processing subject: "+s
    destPath = spath+'/'+s
    subRuns = getNumRuns(spath,s)
    subPts = getNumPts(spath,s)
    if subRuns != nOrigRuns:
        errorlog+="Subject "+ s +" has " + str(subRuns) + " runs, not " + str(nOrigRuns) + " runs.\n"
        break
    if subPts != nPts:
        errorlog+="Subject "+ s +" has " + str(subPts) + " points, not " + str(nPts) + " points.\n"
        break
    nextBatch = origtemplate
    nextBatch = nextBatch.replace(origPath,destPath)
    generatedBatches.append(destPath+'/batch/'+finalname)
    fout = open(destPath+'/batch/'+finalname,'w')
    fout.write(nextBatch)
    fout.close()

errfile = spath + "/errors_preproc" + datetime.datetime.now().strftime("%Y_%m_%d_%Hh_%Mm")
if len(errorlog)>0:
    fe = open(errfile,'w+')
    for err in errorlog.split('\n'):
        fe.write(err)
    fe.close()

for gb in generatedBatches:
    bsubcmd = "bsub -e " + errfile
    bsubcmd = bsubcmd + " -o " + os.path.dirname(gb) + "/../output_files/output_preproc" 
    bsubcmd = bsubcmd + datetime.datetime.now().strftime("%Y_%m_%d_%Hh_%Mm")
    bsubcmd = bsubcmd + " -q ncf"
    bsubcmd = bsubcmd + ' matlab -nodisplay -r \"runSPMBatch(\'' + gb + '\')\"'
    print "Running bsub as follows:"
    print bsubcmd
    os.system(bsubcmd)
    
print errorlog
# append errorlog 
