#!/usr/bin/env python
import argparse
import os

parser = argparse.ArgumentParser(description='Generates files necessary to run your first level analysis with art')
parser.add_argument('-p','--path', help='the path to the directory containing the subjects', required=True, nargs=1)

parser.add_argument('-s','--subjectid', help='the name of the subject(s)', required=False, nargs='*')
parser.add_argument('-f','--subjectfile', help='the name of the file containing subject(s)', required=False, nargs=1)

parser.add_argument('-gt','--globalthreshold', help='Threshold for outlier based on global signal (actual value or std)', required=True, nargs=1)

parser.add_argument('-mt','--motionthreshold', help='Include for use_diff_global', required=True, nargs=1)

parser.add_argument('-g','--diffglobal', help='Include for use_diff_global', required=False)

parser.add_argument('-m','--diffmotion', help='Include for use_diff_motion', required=False)

parser.add_argument('-n','--norms', help='Include for use_norms', required=False)


# input_use_diff_global, input_use_diff_motion, input_use_norms, input_global_threshold, input_motion_threshold
args = vars(parser.parse_args())

if args["subjectfile"]:
    substr = "\'"+args["subjectfile"][0]+"\'"
elif args["subjectid"]:
    substr = "{\'"+"\',\'".join(args["subjectid"])+"\'}"
else:
    raise Exception("Must specify either a subject file (-f) or subjectid (-s)")
    
runcmd = 'matlab -nodisplay -r "try; genArtBatches('
runcmd += "\'"+args["path"][0]+"\'"
runcmd += ','+substr
if args["diffglobal"]:
    runcmd += ',1'
else:
    runcmd += ',0'

if args["diffmotion"]:
    runcmd += ',1'
else:
    runcmd += ',0'

if args["norms"]:
    runcmd += ',1,'
else:
    runcmd += ',0,'

runcmd+= args["globalthreshold"][0]+','+args["motionthreshold"][0]

runcmd += ')'
runcmd += '; catch ME; disp(ME.message);'
runcmd += "end; exit()\""

os.system(runcmd)
