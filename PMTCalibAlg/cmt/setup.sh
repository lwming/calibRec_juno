# echo "setup PMTCalibAlg v0 in /junofs/users/zhangxt/github/calibRec_juno"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtPMTCalibAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtPMTCalibAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=PMTCalibAlg -version=v0 -path=/junofs/users/zhangxt/github/calibRec_juno  -no_cleanup $* >${cmtPMTCalibAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=PMTCalibAlg -version=v0 -path=/junofs/users/zhangxt/github/calibRec_juno  -no_cleanup $* >${cmtPMTCalibAlgtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtPMTCalibAlgtempfile}
  unset cmtPMTCalibAlgtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtPMTCalibAlgtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtPMTCalibAlgtempfile}
unset cmtPMTCalibAlgtempfile
return $cmtsetupstatus

