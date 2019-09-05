# echo "cleanup PMTCalibSvc v0 in /junofs/users/huangx/HXProject/MyProject"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Release/J17v1r1/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtPMTCalibSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtPMTCalibSvctempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=PMTCalibSvc -version=v0 -path=/junofs/users/huangx/HXProject/MyProject  $* >${cmtPMTCalibSvctempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=PMTCalibSvc -version=v0 -path=/junofs/users/huangx/HXProject/MyProject  $* >${cmtPMTCalibSvctempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtPMTCalibSvctempfile}
  unset cmtPMTCalibSvctempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtPMTCalibSvctempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtPMTCalibSvctempfile}
unset cmtPMTCalibSvctempfile
return $cmtcleanupstatus
