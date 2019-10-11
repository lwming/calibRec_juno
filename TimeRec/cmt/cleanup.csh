# echo "cleanup TimeRec v0 in /junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtTimeRectempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtTimeRectempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=TimeRec -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  $* >${cmtTimeRectempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=TimeRec -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  $* >${cmtTimeRectempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtTimeRectempfile}
  unset cmtTimeRectempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtTimeRectempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtTimeRectempfile}
unset cmtTimeRectempfile
exit $cmtcleanupstatus

