# echo "setup PMTCalib v0 in /junofs/users/zhangxt/github/calibRec_juno"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtPMTCalibtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtPMTCalibtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=PMTCalib -version=v0 -path=/junofs/users/zhangxt/github/calibRec_juno  -no_cleanup $* >${cmtPMTCalibtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=PMTCalib -version=v0 -path=/junofs/users/zhangxt/github/calibRec_juno  -no_cleanup $* >${cmtPMTCalibtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtPMTCalibtempfile}
  unset cmtPMTCalibtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtPMTCalibtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtPMTCalibtempfile}
unset cmtPMTCalibtempfile
return $cmtsetupstatus

