#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: yuzy@ihep.ac.cn
# July 12, 2016
# Usage: python $DECONVOLUTIONROOT/share/run.py --evtmax -1 --input elecsim.root --output calib.root

import Sniper

def get_parser():

    import argparse

    parser = argparse.ArgumentParser(description='PMT waveform reconstruction')

    import argparse

    parser = argparse.ArgumentParser(description='Waveform First Hit Time Reconstrtion.')
    parser.add_argument("--evtmax", type=int, default=-1, help='events to be processed')
    parser.add_argument("--input", default="sample_elecsim.root", help="input file name")
    parser.add_argument("--output", default="sample_calib.root", help="output file name")
    parser.add_argument("--loglevel", default="Info",
                            choices=["Test", "Debug", "Info", "Warn", "Error", "Fatal"],
                            )
    parser.add_argument("--user-output", default="calib_user.root", help="output user file name")
    parser.add_argument("--algOption",default="fixed", help="rec alg options")
    #parser.add_argument("--CalibFile", default="/junofs/users/yuzy/Offline/Reconstruction/Deconvolution/share/SPE.root", help="SPE File location")
# The default parameters are for J16v2. Never modify them. 
    return parser

DATA_LOG_MAP = {"Test":0, "Debug":2, "Info":3, "Warn":4, "Error":5, "Fatal":6 }

if __name__ == "__main__":

    parser = get_parser()
    args = parser.parse_args()

    task = Sniper.Task("task")
    #task.asTop()
    task.setEvtMax(args.evtmax)
    task.setLogLevel(DATA_LOG_MAP[args.loglevel])

    # Create Data Buffer Svc
    import DataRegistritionSvc
    task.createSvc("DataRegistritionSvc")

    #create buffer Svc
    import BufferMemMgr
    bufMgr = task.createSvc("BufferMemMgr")
    bufMgr.property("TimeWindow").set([0, 0])

    # Create IO Svc
    import RootIOSvc
    inputsvc = task.createSvc("RootInputSvc/InputSvc")
    if args.input.find('list') > -1:

        arr = []
        file1 = open(args.input)
        for line in file1 :
            line = line.strip()
            arr.append(line)
        inputsvc.property("InputFile").set(arr)
    else:
        inputsvc.property("InputFile").set([args.input])

    roSvc = task.createSvc("RootOutputSvc/OutputSvc")
    roSvc.property("OutputStreams").set({"/Event/Calib":args.output})

    # user output
    import RootWriter
    rootwriter = task.createSvc("RootWriter")
    rootwriter.property("Output").set({"CALIBEVT":args.user_output})

    #import Deconvolution 
    Sniper.loadDll("libTimeRec.so")
    timeRec=task.createAlg("TimeRec")
    timeRec.property("AlgOption").set(args.algOption)
    task.show()
    task.run()


