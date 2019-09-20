#!/bin/bash
source /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/setup.sh
pushd /junofs/users/zhangxt/github/calibRec_juno/PMTCalibAlg/share
source /junofs/users/zhangxt/github/calibRec_juno/PMTCalibAlg/cmt/setup.sh
#(time python run.py --evtmax 2000 --input /junofs/users/zhangxt/20inch/rec/deconvolution/calib-test.root --calibmode LED) >& caliblog-test.txt
(time python run.py --evtmax -1 --input /junofs/users/zhangxt/20inch/rec/deconvolution/runs/calib.list --calibmode LED) >& caliblog-test.txt
popd
