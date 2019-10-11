# echo "setup TimeRec v0 in /junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtTimeRectempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtTimeRectempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=TimeRec -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  -no_cleanup $* >${cmtTimeRectempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=TimeRec -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  -no_cleanup $* >${cmtTimeRectempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtTimeRectempfile}
  unset cmtTimeRectempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtTimeRectempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtTimeRectempfile}
unset cmtTimeRectempfile
exit $cmtsetupstatus

