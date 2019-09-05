# echo "setup PMTCalibSvc v0 in /afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtPMTCalibSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtPMTCalibSvctempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=PMTCalibSvc -version=v0 -path=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno  -no_cleanup $* >${cmtPMTCalibSvctempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=PMTCalibSvc -version=v0 -path=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno  -no_cleanup $* >${cmtPMTCalibSvctempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtPMTCalibSvctempfile}
  unset cmtPMTCalibSvctempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtPMTCalibSvctempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtPMTCalibSvctempfile}
unset cmtPMTCalibSvctempfile
exit $cmtsetupstatus

