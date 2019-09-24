#!/bin/bash
source /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J19v1r0-Pre2/setup.sh
pushd /junofs/users/zhangxt/github/calibRec_juno/PMTCalibAlg/share
source /junofs/users/zhangxt/github/calibRec_juno/PMTCalibAlg/cmt/setup.sh
(time python run.py --evtmax -1 --input /junofs/users/zhangxt/20inch/rec/deconvolution/runs/calib.list --calibmode calib --output sample_calibCorr_v19.root --user-output sample_calibCorr_user_v19.root) >& caliblog-test-v19.txt
popd
