# echo "cleanup PMTCalibAlg v0 in /afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtPMTCalibAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtPMTCalibAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=PMTCalibAlg -version=v0 -path=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno  $* >${cmtPMTCalibAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=PMTCalibAlg -version=v0 -path=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno  $* >${cmtPMTCalibAlgtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtPMTCalibAlgtempfile}
  unset cmtPMTCalibAlgtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtPMTCalibAlgtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtPMTCalibAlgtempfile}
unset cmtPMTCalibAlgtempfile
return $cmtcleanupstatus

