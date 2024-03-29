# echo "setup PMTCalib v0 in /junofs/users/yumiao/reconstruction/juno_wr/Calibration"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtPMTCalibtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtPMTCalibtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=PMTCalib -version=v0 -path=/junofs/users/yumiao/reconstruction/juno_wr/Calibration  -no_cleanup $* >${cmtPMTCalibtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=PMTCalib -version=v0 -path=/junofs/users/yumiao/reconstruction/juno_wr/Calibration  -no_cleanup $* >${cmtPMTCalibtempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtPMTCalibtempfile}
  unset cmtPMTCalibtempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtPMTCalibtempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtPMTCalibtempfile}
unset cmtPMTCalibtempfile
exit $cmtsetupstatus

