# echo "cleanup TimeCorrAlg v0 in /junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtTimeCorrAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtTimeCorrAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=TimeCorrAlg -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  $* >${cmtTimeCorrAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=TimeCorrAlg -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  $* >${cmtTimeCorrAlgtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtTimeCorrAlgtempfile}
  unset cmtTimeCorrAlgtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtTimeCorrAlgtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtTimeCorrAlgtempfile}
unset cmtTimeCorrAlgtempfile
return $cmtcleanupstatus

