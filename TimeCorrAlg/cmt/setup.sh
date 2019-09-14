# echo "setup TimeCorrAlg v0 in /junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtTimeCorrAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtTimeCorrAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=TimeCorrAlg -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  -no_cleanup $* >${cmtTimeCorrAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=TimeCorrAlg -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  -no_cleanup $* >${cmtTimeCorrAlgtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtTimeCorrAlgtempfile}
  unset cmtTimeCorrAlgtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtTimeCorrAlgtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtTimeCorrAlgtempfile}
unset cmtTimeCorrAlgtempfile
return $cmtsetupstatus

