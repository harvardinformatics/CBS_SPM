import argparse
import glob,re

errorlog = ''

def getNumRuns(spath,s):
    print spath+'/'+s+'/preproc'
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
    print 'glob:' + spath+'/'+s+'/preproc/*run*'
    print fruns
    nPts = reduce(max,map(lambda x: int(re.search('run\d*-(\d+)',x).group(1)),fruns))
    nRuns = getNumRuns(spath,s)
    for i in range(1,nRuns+1):
        fruns = glob.glob(spath+'/'+s+'/preproc/*run'+str.zfill(str(i),3)+'*')
        print 'glob: '+spath+'/'+s+'/preproc/*run'+str.zfill(str(i),3)+'*'
        print fruns
        nPts_i = reduce(max,map(lambda x: int(re.search('run\d*-(\d+)',x).group(1)),fruns))
        if nPts_i != nPts:
            errorlog = errorlog+"Subject " +s+ " has mismached numbers of points"
            return None
            
        
    
# parse the arguments

parser = argparse.ArgumentParser(description='klasdfkjasdf')
parser.add_argument('-t','--template', help='Template batch file', required=True)
parser.add_argument('-p','--path', help='Path to subjects', required=True, nargs=1)
parser.add_argument('-s','--subjects', help='List of subjects', required=False, nargs='*')
parser.add_argument('-f','--subjectfile', help='File containing subjects', required=False)
args = vars(parser.parse_args())

print args

f = open(args["template"])
origtemplate = f.read()
f.close()


spath = args["path"][0]

if args["subjects"]:
    sublist = args["subjects"]
elif args["subjectfile"]:
    print "do this later"

runList = re.findall('.*run(\d+)',origtemplate)
nOrigRuns = reduce(max,map(int,runList))
epiList = re.findall('.*run\d+-(\d+)',origtemplate)
nPts = reduce(max,map(int,epiList))
origPath = re.findall('(/.*)/preproc/',origtemplate)[0]

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
    fout = open(destPath+'/batch/preproc.m','w')
    fout.write(nextBatch)
    fout.close()

