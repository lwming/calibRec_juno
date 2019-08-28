# echo "cleanup PMTCalibAlg v0 in /junofs/users/zhangxt/20inch/rec/deconvolution"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Release/J17v1r1/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtPMTCalibAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtPMTCalibAlgtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=PMTCalibAlg -version=v0 -path=/junofs/users/zhangxt/20inch/rec/deconvolution  $* >${cmtPMTCalibAlgtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=PMTCalibAlg -version=v0 -path=/junofs/users/zhangxt/20inch/rec/deconvolution  $* >${cmtPMTCalibAlgtempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtPMTCalibAlgtempfile}
  unset cmtPMTCalibAlgtempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtPMTCalibAlgtempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtPMTCalibAlgtempfile}
unset cmtPMTCalibAlgtempfile
exit $cmtcleanupstatus
