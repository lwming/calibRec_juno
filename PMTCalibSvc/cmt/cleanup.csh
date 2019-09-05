# echo "cleanup PMTCalibSvc v0 in /afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtPMTCalibSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtPMTCalibSvctempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=PMTCalibSvc -version=v0 -path=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno  $* >${cmtPMTCalibSvctempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=PMTCalibSvc -version=v0 -path=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno  $* >${cmtPMTCalibSvctempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtPMTCalibSvctempfile}
  unset cmtPMTCalibSvctempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtPMTCalibSvctempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtPMTCalibSvctempfile}
unset cmtPMTCalibSvctempfile
exit $cmtcleanupstatus

