# echo "cleanup PMTCalibAlg v0 in /junofs/users/zhangxt/20inch/rec/deconvolution"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Release/J17v1r1/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtPMTCalibAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtPMTCalibAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=PMTCalibAlg -version=v0 -path=/junofs/users/zhangxt/20inch/rec/deconvolution  $* >${cmtPMTCalibAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=PMTCalibAlg -version=v0 -path=/junofs/users/zhangxt/20inch/rec/deconvolution  $* >${cmtPMTCalibAlgtempfile}"
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
