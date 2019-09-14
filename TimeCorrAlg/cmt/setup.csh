# echo "setup TimeCorrAlg v0 in /junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtTimeCorrAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtTimeCorrAlgtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=TimeCorrAlg -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  -no_cleanup $* >${cmtTimeCorrAlgtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=TimeCorrAlg -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  -no_cleanup $* >${cmtTimeCorrAlgtempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtTimeCorrAlgtempfile}
  unset cmtTimeCorrAlgtempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtTimeCorrAlgtempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtTimeCorrAlgtempfile}
unset cmtTimeCorrAlgtempfile
exit $cmtsetupstatus
