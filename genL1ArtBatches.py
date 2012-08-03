#!/usr/bin/env python
import argparse
import os

parser = argparse.ArgumentParser(description='Update the Level 1 Analysis batches after running ART.')
parser.add_argument('-p','--path', help='the path containing the subject directories (e.g. /users/me/data)', required=True, nargs=1)
parser.add_argument('-t','--template', help='The name of the batchfile, e.g., myLevel1Batch.m', required=True, nargs=1)

parser.add_argument('-s','--subjectid', help='the name of the subject(s)', required=False, nargs='*')
parser.add_argument('-f','--subjectfile', help='the name of the file containing subject(s)', required=False, nargs=1)


args = vars(parser.parse_args())

if args["subjectfile"]:
    substr = "\'"+args["subjectfile"][0]+"\'"
elif args["subjectid"]:
    substr = "{\'"+"\',\'".join(args["subjectid"])+"\'}"
else:
    raise Exception("Must specify either a subject file (-f) or subjectid (-s)")
    
runcmd = 'matlab -nodisplay -r "try; genL1PostArt('
runcmd += "\'"+args["path"][0]+"\'"
runcmd += ','+substr+','
runcmd += "{\'"+args["template"][0]+"\'}"
runcmd += ')'
runcmd += '; catch ME; disp(ME.message);'
runcmd += "end; exit()\""

print runcmd
os.system(runcmd)
