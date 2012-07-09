#!/usr/bin/env python
import argparse

parser = argparse.ArgumentParser(description='Download a single SPM subject and set up the correct directory structure.')
parser.add_argument('-p','--destpath', help='the path where this data will go after conversion (e.g. /users/me/data)', required=True, nargs=1)
parser.add_argument('-s','--subjectid', help='the name of the subject in CBSCentral', required=True, nargs=1)
parser.add_argument('-b','--boldruns', help='the run numbers for the BOLD scans (e.g. 1 or 1 2 3 4)', required=True, nargs='*')
parser.add_argument('-t','--structrun', help='the run number for the structural scan', required=True, nargs=1)
parser.add_argument('-m','--fieldmap', help='the run numbers for the fieldmap scans (if present, the two runs, e.g. 6 7)', required=False, nargs=2)
parser.add_argument('-d','--dicompath', help="the path to dicoms, in the event that you don't want to  cbsget, but you do have the dicoms already unzipped in a folder.", required=False, nargs=1)
args = vars(parser.parse_args())

# subjectid:  the name of the subject in CBSCentral (in single quotes, e.g. 'my_subj_name')
# boldruns:   the run numbers for the BOLD scans (in brackets if more than one run, e.g. 1 or [1,2])
# structrun:  the run number for the structural scan (same as boldruns)
# fmruns:     the run numbers for the fieldmap scan (same as boldruns)
#             The fieldmap is optional. If you don't have one, put empty brackets, e.g. []

# destpath:   the path where this data will go after conversion (e.g. /users/me/data)
# dicompath:  the path to dicoms, in the event that you don't want to run
#             cbsget, but you do have the dicoms already unzipped in a folder.

# getsubject(subjectid,boldruns,structrun,fmruns,destpath,varargin)
runcmd = 'matlab -nodisplay -r "try \ngetsubject('
runcmd += "\'"+args["subjectid"][0]+"\'"
runcmd += ','
runcmd += '['+''.join([b+',' for b in args["boldruns"]])[0:-1]+']'
runcmd += ','
runcmd += '['+args["structrun"][0]+']'
runcmd += ','
if args["fieldmap"]:
    runcmd += '['+args["fieldmap"][0]+','+args["fieldmap"][1]+']'
else:
    runcmd += '[]'
runcmd += ','
runcmd += "\'"+args["destpath"][0]+"\'"
if args["dicompath"]:
    runcmd += ",\'"+args["dicompath"][0]+"\'"
runcmd += ')"'
runcmd += '\ncatch\n'
runcmd += "exit()\n"
runcmd += "end"


print runcmd
