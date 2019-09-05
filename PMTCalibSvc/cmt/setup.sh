<<<<<<< HEAD
# echo "setup PMTCalibSvc v0 in /junofs/users/huangx/HXProject/MyProject"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Release/J17v1r1/ExternalLibs/CMT/v1r26; export CMTROOT
=======
# echo "setup PMTCalibSvc v0 in /junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
>>>>>>> feature-ym
fi
. ${CMTROOT}/mgr/setup.sh
cmtPMTCalibSvctempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtPMTCalibSvctempfile=/tmp/cmt.$$; fi
<<<<<<< HEAD
${CMTROOT}/mgr/cmt setup -sh -pack=PMTCalibSvc -version=v0 -path=/junofs/users/huangx/HXProject/MyProject  -no_cleanup $* >${cmtPMTCalibSvctempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=PMTCalibSvc -version=v0 -path=/junofs/users/huangx/HXProject/MyProject  -no_cleanup $* >${cmtPMTCalibSvctempfile}"
=======
${CMTROOT}/mgr/cmt setup -sh -pack=PMTCalibSvc -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  -no_cleanup $* >${cmtPMTCalibSvctempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=PMTCalibSvc -version=v0 -path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno  -no_cleanup $* >${cmtPMTCalibSvctempfile}"
>>>>>>> feature-ym
  cmtsetupstatus=2
  /bin/rm -f ${cmtPMTCalibSvctempfile}
  unset cmtPMTCalibSvctempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtPMTCalibSvctempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtPMTCalibSvctempfile}
unset cmtPMTCalibSvctempfile
return $cmtsetupstatus

