CMTPATH=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
CMT_tag=$(tag)
CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26
CMT_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26
CMTVERSION=v1r26
CMT_offset=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs
cmt_hardware_query_command=uname -m
cmt_hardware=`$(cmt_hardware_query_command)`
cmt_system_version_query_command=${CMTROOT}/mgr/cmt_linux_version.sh | ${CMTROOT}/mgr/cmt_filter_version.sh
cmt_system_version=`$(cmt_system_version_query_command)`
cmt_compiler_version_query_command=${CMTROOT}/mgr/cmt_gcc_version.sh | ${CMTROOT}/mgr/cmt_filter3_version.sh
cmt_compiler_version=`$(cmt_compiler_version_query_command)`
PATH=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26/${CMTBIN}:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-cpp/1.1.8/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-c/6.1.9/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/libmore/0.8.3/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Geant4/10.04.p02/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/HepMC/2.06.09/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/CLHEP/2.4.0.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/tbb/2017/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/fftw3/3.3.7/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/gsl/1.16/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Xercesc/3.1.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Cmake/3.9.6/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Boost/1.65.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Python/2.7.15/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/binutils/2.28/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/gcc/4.9.4/bin:/usr/lib64/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/bin:/usr/bin:/usr/externals/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/sbin:/usr/java/latest/bin:/opt/puppetlabs/bin:/afs/ihep.ac.cn/soft/common/sysgroup/hep_job/bin/
CLASSPATH=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26/java
debug_option=-g
cc=gcc
ccomp=$(cc) -c $(includes) $(cdebugflags) $(cflags) $(pp_cflags)
clink=$(cc) $(clinkflags) $(cdebugflags)
ppcmd=-I
preproc=c++ -MD -c 
cpp=g++
cppflags=-std=c++11 -fPIC -pipe -W -Wall -Wwrite-strings -Wpointer-arith -Woverloaded-virtual 
pp_cppflags=-D_GNU_SOURCE
cppcomp=$(cpp) -c $(includes) $(cppdebugflags) $(cppflags) $(pp_cppflags)
cpplink=$(cpp) $(cpplinkflags) $(cppdebugflags)
for=g77
fflags=$(debug_option)
fcomp=$(for) -c $(fincludes) $(fflags) $(pp_fflags)
flink=$(for) $(flinkflags)
javacomp=javac -classpath $(src):$(CLASSPATH) 
javacopy=cp
jar=jar
X11_cflags=-I/usr/include
Xm_cflags=-I/usr/include
X_linkopts=-L/usr/X11R6/lib -lXm -lXt -lXext -lX11 -lm
lex=lex $(lexflags)
yaccflags= -l -d 
yacc=yacc $(yaccflags)
ar=ar cr
ranlib=ranlib
make_shlib=${CMTROOT}/mgr/cmt_make_shlib_common.sh extract
shlibsuffix=so
shlibbuilder=g++ $(cmt_installarea_linkopts) 
shlibflags=-shared
symlink=/bin/ln -fs 
symunlink=/bin/rm -f 
library_install_command=python $(SniperPolicy_root)/cmt/fragments/install.py -xCVS -x.svn -x*~ -x*.stamp -s --log=./install.history 
build_library_links=$(cmtexe) build library_links -tag=$(tags)
remove_library_links=$(cmtexe) remove library_links -tag=$(tags)
cmtexe=${CMTROOT}/${CMTBIN}/cmt.exe
build_prototype=$(cmtexe) build prototype
build_dependencies=$(cmtexe) -tag=$(tags) build dependencies
build_triggers=$(cmtexe) build triggers
format_dependencies=${CMTROOT}/mgr/cmt_format_deps.sh
implied_library_prefix=-l
SHELL=/bin/sh
q="
src=../src/
doc=../doc/
inc=../src/
mgr=../cmt/
application_suffix=.exe
library_prefix=lib
unlock_command=rm -rf 
lock_name=cmt
lock_suffix=.lock
lock_file=${lock_name}${lock_suffix}
svn_checkout_command=python ${CMTROOT}/mgr/cmt_svn_checkout.py 
gmake_hosts=lx1 rsplus lxtest as7 dxplus ax7 hp2 aleph hp1 hpplus papou1-fe atlas
make_hosts=virgo-control1 rio0a vmpc38a
everywhere=hosts
install_command=python $(SniperPolicy_root)/cmt/fragments/install.py -xCVS -x.svn -x*~ -x*.stamp --log=./install.history 
uninstall_command=python $(SniperPolicy_root)/cmt/fragments/install.py -u --log=./install.history 
cmt_installarea_command=python $(SniperPolicy_root)/cmt/fragments/install.py -xCVS -x.svn -x*~ -x*.stamp -s --log=./install.history 
cmt_uninstallarea_command=/bin/rm -f 
cmt_install_area_command=$(cmt_installarea_command)
cmt_uninstall_area_command=$(cmt_uninstallarea_command)
cmt_install_action=$(CMTROOT)/mgr/cmt_install_action.sh
cmt_installdir_action=$(CMTROOT)/mgr/cmt_installdir_action.sh
cmt_uninstall_action=$(CMTROOT)/mgr/cmt_uninstall_action.sh
cmt_uninstalldir_action=$(CMTROOT)/mgr/cmt_uninstalldir_action.sh
mkdir=mkdir
cmt_cvs_protocol_level=v1r1
cmt_installarea_prefix=InstallArea
CMT_PATH_remove_regexp=/[^/]*/
CMT_PATH_remove_share_regexp=/share/
NEWCMTCONFIG=x86_64-sl69-gcc494
PMTCalibAlg_tag=$(tag)
PMTCALIBALGROOT=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/PMTCalibAlg
PMTCalibAlg_root=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/PMTCalibAlg
PMTCALIBALGVERSION=v0
PMTCalibAlg_cmtpath=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno
PMTCalibAlg_project=calibRec_juno
SniperRelease_tag=$(tag)
SNIPERRELEASEROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperRelease
SniperRelease_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperRelease
SNIPERRELEASEVERSION=v2
SniperRelease_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
SniperRelease_project=sniper
SniperPolicy_tag=$(tag)
SNIPERPOLICYROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperPolicy
SniperPolicy_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperPolicy
SNIPERPOLICYVERSION=v0
SniperPolicy_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
SniperPolicy_project=sniper
libraryshr_linkopts=-fPIC -ldl -Wl,--as-needed -Wl,--no-undefined 
application_linkopts=-Wl,--export-dynamic 
BINDIR=$(tag)
remove_command=$(cmt_uninstallarea_command)
SniperKernel_tag=$(tag)
SNIPERKERNELROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperKernel
SniperKernel_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperKernel
SNIPERKERNELVERSION=v2
SniperKernel_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
SniperKernel_project=sniper
Boost_tag=$(tag)
BOOSTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/Boost
Boost_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/Boost
BOOSTVERSION=v0
Boost_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
Boost_offset=Externals
Boost_project=ExternalInterface
Python_tag=$(tag)
PYTHONROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/Python
Python_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/Python
PYTHONVERSION=v0
Python_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
Python_offset=Externals
Python_project=ExternalInterface
Python_linkopts= `pkg-config --libs python` 
Python_cppflags= `pkg-config --cflags python` 
Boost_home=${JUNO_EXTLIB_Boost_HOME}
Boost_linkopts= -L$(Boost_home)/lib  -lboost_python  -lboost_filesystem -lboost_system 
includes= $(ppcmd)"$(srcdir)" $(ppcmd)"/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/InstallArea/include" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/include" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/include" $(use_includes)
PYTHONPATH=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/InstallArea/python:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/python:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/python:/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Python/2.7.15/lib/./python2.7/lib-dynload:/usr/lib64/python
SniperKernel_linkopts= -lSniperKernel  -lSniperPython 
SniperKernel_stamps=${SNIPERKERNELROOT}/${BINDIR}/SniperPython.stamp 
SniperKernel_linker_library=SniperPython
SniperPython_dependencies=SniperKernel
SniperPython_shlibflags= -lSniperKernel 
DataBuffer_tag=$(tag)
DATABUFFERROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperUtil/DataBuffer
DataBuffer_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperUtil/DataBuffer
DATABUFFERVERSION=v0
DataBuffer_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
DataBuffer_offset=SniperUtil
DataBuffer_project=sniper
HelloWorld_tag=$(tag)
HELLOWORLDROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/Examples/HelloWorld
HelloWorld_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/Examples/HelloWorld
HELLOWORLDVERSION=v1
HelloWorld_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
HelloWorld_offset=Examples
HelloWorld_project=sniper
RootWriter_tag=$(tag)
ROOTWRITERROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperSvc/RootWriter
RootWriter_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperSvc/RootWriter
ROOTWRITERVERSION=v0
RootWriter_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
RootWriter_offset=SniperSvc
RootWriter_project=sniper
ROOT_tag=$(tag)
ROOTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/ROOT
ROOT_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/ROOT
ROOTVERSION=v0
ROOT_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
ROOT_offset=Externals
ROOT_project=ExternalInterface
ROOT_home=${JUNO_EXTLIB_ROOT_HOME}
ROOT_cppflags=`root-config --cflags` -Wno-long-long 
ROOT_linkopts= -Wl,--no-as-needed `root-config --evelibs` -lPyROOT  -Wl,--as-needed 
rootcint="$(ROOT_home)/bin/rootcint"
RootWriter_linkopts= -lRootWriter 
RootWriter_stamps=${ROOTWRITERROOT}/${BINDIR}/RootWriter.stamp 
RootWriter_linker_library=RootWriter
DummyAlg_tag=$(tag)
DUMMYALGROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/Examples/DummyAlg
DummyAlg_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/Examples/DummyAlg
DUMMYALGVERSION=v0
DummyAlg_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
DummyAlg_offset=Examples
DummyAlg_project=sniper
ElecEvent_tag=$(tag)
ELECEVENTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/ElecEvent
ElecEvent_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/ElecEvent
ELECEVENTVERSION=v0
ElecEvent_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
ElecEvent_offset=DataModel
ElecEvent_project=offline
XmlObjDesc_tag=$(tag)
XMLOBJDESCROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/XmlObjDesc
XmlObjDesc_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/XmlObjDesc
XMLOBJDESCVERSION=v0
XmlObjDesc_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
XmlObjDesc_project=offline
xmlsrc=xml
BaseEvent_tag=$(tag)
BASEEVENTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/BaseEvent
BaseEvent_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/BaseEvent
BASEEVENTVERSION=v0
BaseEvent_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
BaseEvent_offset=DataModel
BaseEvent_project=offline
XODflags= -n JM  -n JM  -n JM 
BaseEvent_dependencies= BaseEventObj2Doth  BaseEventDict  BaseEventxodsrc 
install_more_includes_dependencies= BaseEventObj2Doth  ElecEventObj2Doth  CalibEventObj2Doth 
BaseEventDict_dependencies= BaseEventObj2Doth  install_more_includes 
BaseEventxodsrc_dependencies= BaseEventObj2Doth 
BaseEvent_linkopts= -lBaseEvent 
BaseEvent_stamps=${BASEEVENTROOT}/${BINDIR}/BaseEvent.stamp 
BaseEvent_linker_library=BaseEvent
EDMUtil_tag=$(tag)
EDMUTILROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EDMUtil
EDMUtil_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EDMUtil
EDMUTILVERSION=v0
EDMUtil_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
EDMUtil_offset=DataModel
EDMUtil_project=offline
EDMUtil_dependencies= EDMUtilDict  EDMUtilDict  EDMUtilDict  EDMUtilDict 
EDMUtilDict_dependencies= EDMUtilObj2Doth  install_more_includes  EDMUtilObj2Doth  install_more_includes  EDMUtilObj2Doth  install_more_includes  EDMUtilObj2Doth  install_more_includes 
EDMUtil_linkopts= -lEDMUtil 
EDMUtil_stamps=${EDMUTILROOT}/${BINDIR}/EDMUtil.stamp 
EDMUtil_linker_library=EDMUtil
Context_tag=$(tag)
CONTEXTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/Context
Context_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/Context
CONTEXTVERSION=v0
Context_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
Context_offset=DataModel
Context_project=offline
Context_cintflags=  
Context_dependencies= ContextDict 
Context_linkopts= -lContext 
Context_stamps=${CONTEXTROOT}/${BINDIR}/Context.stamp 
Context_linker_library=Context
test_Context_write_dependencies=Context
test_Context_read_dependencies=Context
ElecEvent_cintflags=-I$(CMTINSTALLAREA)/include
ElecHeader_cintflags=-I$(CMTINSTALLAREA)/include
ElecFeeCrate_cintflags=-I$(CMTINSTALLAREA)/include
ElecFeeChannel_cintflags=-I$(CMTINSTALLAREA)/include
SpmtElecEvent_cintflags=-I$(CMTINSTALLAREA)/include
SpmtElecAbcBlock_cintflags=-I$(CMTINSTALLAREA)/include
SpmtElecSpecialWord_cintflags=-I$(CMTINSTALAREA)/include
SpmtElecDiscrWord_cintflags=-I$(CMTINSTALAREA)/include
ElecEvent_dependencies= ElecEventObj2Doth  ElecEventDict  ElecEventxodsrc 
ElecEventDict_dependencies= ElecEventObj2Doth  install_more_includes 
ElecEventxodsrc_dependencies= ElecEventObj2Doth 
ElecEvent_linkopts= -lElecEvent 
ElecEvent_stamps=${ELECEVENTROOT}/${BINDIR}/ElecEvent.stamp 
ElecEvent_linker_library=ElecEvent
CalibEvent_tag=$(tag)
CALIBEVENTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/CalibEvent
CalibEvent_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/CalibEvent
CALIBEVENTVERSION=v0
CalibEvent_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
CalibEvent_offset=DataModel
CalibEvent_project=offline
CLHEP_tag=$(tag)
CLHEPROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/CLHEP
CLHEP_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/CLHEP
CLHEPVERSION=v0
CLHEP_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
CLHEP_offset=Externals
CLHEP_project=ExternalInterface
CLHEP_home=${JUNO_EXTLIB_CLHEP_HOME}
CLHEP_linkopts= -L${JUNO_EXTLIB_CLHEP_HOME}/lib -lCLHEP 
CLHEP_cppflags= `clhep-config --include` 
CalibEvent_cintflags=-I$(CMTINSTALLAREA)/include
CalibHeader_cintflags=-I$(CMTINSTALLAREA)/include
TTCalibEvent_cintflags=-I$(CMTINSTALLAREA)/include
CalibEvent_dependencies= CalibEventObj2Doth  CalibEventDict  CalibEventxodsrc 
CalibEventDict_dependencies= CalibEventObj2Doth  install_more_includes 
CalibEventxodsrc_dependencies= CalibEventObj2Doth 
CalibEvent_linkopts= -lCalibEvent 
CalibEvent_stamps=${CALIBEVENTROOT}/${BINDIR}/CalibEvent.stamp 
CalibEvent_linker_library=CalibEvent
EvtNavigator_tag=$(tag)
EVTNAVIGATORROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EvtNavigator
EvtNavigator_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EvtNavigator
EVTNAVIGATORVERSION=v0
EvtNavigator_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
EvtNavigator_offset=DataModel
EvtNavigator_project=offline
EvtNavigator_cintflags= -I$(BASEEVENTROOT) -I$(EDMUTILROOT) 
EvtNavigator_dependencies= EvtNavigatorDict 
EvtNavigatorDict_dependencies= EvtNavigatorObj2Doth  install_more_includes 
EvtNavigator_linkopts= -lEvtNavigator 
EvtNavigator_stamps=${EVTNAVIGATORROOT}/${BINDIR}/EvtNavigator.stamp 
EvtNavigator_linker_library=EvtNavigator
DataRegistritionSvc_tag=$(tag)
DATAREGISTRITIONSVCROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/DataRegistritionSvc
DataRegistritionSvc_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/DataRegistritionSvc
DATAREGISTRITIONSVCVERSION=v0
DataRegistritionSvc_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
DataRegistritionSvc_offset=DataModel
DataRegistritionSvc_project=offline
DataRegistritionSvc_linkopts= -lDataRegistritionSvc 
DataRegistritionSvc_stamps=${DATAREGISTRITIONSVCROOT}/${BINDIR}/DataRegistritionSvc.stamp 
DataRegistritionSvc_linker_library=DataRegistritionSvc
Identifier_tag=$(tag)
IDENTIFIERROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/Detector/Identifier
Identifier_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/Detector/Identifier
IDENTIFIERVERSION=v0
Identifier_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
Identifier_offset=Detector
Identifier_project=offline
Identifier_linkopts= -lIdentifier 
Identifier_stamps=${IDENTIFIERROOT}/${BINDIR}/Identifier.stamp 
Identifier_linker_library=Identifier
RootIOSvc_tag=$(tag)
ROOTIOSVCROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/RootIO/RootIOSvc
RootIOSvc_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/RootIO/RootIOSvc
ROOTIOSVCVERSION=v0
RootIOSvc_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
RootIOSvc_offset=RootIO
RootIOSvc_project=offline
RootIOUtil_tag=$(tag)
ROOTIOUTILROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/RootIO/RootIOUtil
RootIOUtil_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/RootIO/RootIOUtil
ROOTIOUTILVERSION=v0
RootIOUtil_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
RootIOUtil_offset=RootIO
RootIOUtil_project=offline
RootIOUtil_linkopts= -lRootIOUtil 
RootIOUtil_stamps=${ROOTIOUTILROOT}/${BINDIR}/RootIOUtil.stamp 
RootIOUtil_linker_library=RootIOUtil
RootIOSvc_linkopts= -lRootIOSvc 
RootIOSvc_stamps=${ROOTIOSVCROOT}/${BINDIR}/RootIOSvc.stamp 
RootIOSvc_linker_library=RootIOSvc
PMTCalibSvc_tag=$(tag)
PMTCALIBSVCROOT=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/PMTCalibSvc
PMTCalibSvc_root=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/PMTCalibSvc
PMTCALIBSVCVERSION=v0
PMTCalibSvc_cmtpath=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno
PMTCalibSvc_project=calibRec_juno
PMTCalibSvc_linkopts= -lPMTCalibSvc 
PMTCalibSvc_stamps=${PMTCALIBSVCROOT}/${BINDIR}/PMTCalibSvc.stamp 
PMTCalibSvc_linker_library=PMTCalibSvc
PMTCalibAlg_linkopts= -lPMTCalibAlg 
PMTCalibAlg_shlibflags=$(libraryshr_linkopts) $(cmt_installarea_linkopts) $(PMTCalibAlg_use_linkopts)
PMTCalibAlg_use_linkopts=    $(SniperRelease_linkopts)  $(DataBuffer_linkopts)  $(HelloWorld_linkopts)  $(DummyAlg_linkopts)  $(RootWriter_linkopts)  $(ElecEvent_linkopts)  $(CalibEvent_linkopts)  $(RootIOSvc_linkopts)  $(RootIOUtil_linkopts)  $(EvtNavigator_linkopts)  $(DataRegistritionSvc_linkopts)  $(EDMUtil_linkopts)  $(Identifier_linkopts)  $(PMTCalibSvc_linkopts)  $(SniperKernel_linkopts)  $(BaseEvent_linkopts)  $(Context_linkopts)  $(SniperPolicy_linkopts)  $(Boost_linkopts)  $(Python_linkopts)  $(ROOT_linkopts)  $(CLHEP_linkopts) 
PMTCalibAlg_stamps=${PMTCALIBALGROOT}/${BINDIR}/PMTCalibAlg.stamp 
PMTCalibAlg_linker_library=PMTCalibAlg
tag=amd64_linux26
package=PMTCalibAlg
version=v0
PACKAGE_ROOT=$(PMTCALIBALGROOT)
srcdir=../src
bin=../$(PMTCalibAlg_tag)/
javabin=../classes/
mgrdir=cmt
BIN=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/PMTCalibAlg/amd64_linux26/
project=calibRec_juno
cmt_installarea_paths= $(cmt_installarea_prefix)/$(CMTCONFIG)/bin $(sniper_installarea_prefix)/$(CMTCONFIG)/lib $(sniper_installarea_prefix)/share/lib $(sniper_installarea_prefix)/share/bin $(offline_installarea_prefix)/$(CMTCONFIG)/lib $(offline_installarea_prefix)/share/lib $(offline_installarea_prefix)/share/bin $(calibRec_juno_installarea_prefix)/$(CMTCONFIG)/lib $(calibRec_juno_installarea_prefix)/share/lib $(calibRec_juno_installarea_prefix)/share/bin
use_linkopts= $(cmt_installarea_linkopts)   $(PMTCalibAlg_linkopts)  $(SniperRelease_linkopts)  $(DataBuffer_linkopts)  $(HelloWorld_linkopts)  $(DummyAlg_linkopts)  $(RootWriter_linkopts)  $(ElecEvent_linkopts)  $(CalibEvent_linkopts)  $(RootIOSvc_linkopts)  $(RootIOUtil_linkopts)  $(EvtNavigator_linkopts)  $(DataRegistritionSvc_linkopts)  $(EDMUtil_linkopts)  $(Identifier_linkopts)  $(PMTCalibSvc_linkopts)  $(SniperKernel_linkopts)  $(BaseEvent_linkopts)  $(Context_linkopts)  $(SniperPolicy_linkopts)  $(Boost_linkopts)  $(Python_linkopts)  $(ROOT_linkopts)  $(CLHEP_linkopts) 
ExternalInterface_installarea_prefix=$(cmt_installarea_prefix)
ExternalInterface_installarea_prefix_remove=$(ExternalInterface_installarea_prefix)
LD_LIBRARY_PATH=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-cpp/1.1.8/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-c/6.1.9/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/libmore/0.8.3/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Geant4/10.04.p02/lib64:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/HepMC/2.06.09/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/CLHEP/2.4.0.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/tbb/2017/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/fftw3/3.3.7/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/gsl/1.16/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Xercesc/3.1.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Boost/1.65.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Python/2.7.15/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/binutils/2.28/lib64:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/binutils/2.28/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/gcc/4.9.4/lib64:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/gcc/4.9.4/lib:/usr/lib64/classads:/usr/lib64:/usr/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/Xercesc/3.1.1/lib
sniper_installarea_prefix=$(cmt_installarea_prefix)
sniper_installarea_prefix_remove=$(sniper_installarea_prefix)
offline_installarea_prefix=$(cmt_installarea_prefix)
offline_installarea_prefix_remove=$(offline_installarea_prefix)
calibRec_juno_installarea_prefix=$(cmt_installarea_prefix)
calibRec_juno_installarea_prefix_remove=$(calibRec_juno_installarea_prefix)
cmt_installarea_linkopts= -L/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/$(calibRec_juno_installarea_prefix)/$(CMTCONFIG)/lib  -L/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/$(CMTCONFIG)/lib  -L/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/$(CMTCONFIG)/lib 
ExternalInterface_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
sniper_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
offline_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
calibRec_juno_home=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno
calibRec_juno_install_include= /afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/$(calibRec_juno_installarea_prefix)/include 
offline_install_include= /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/include 
sniper_install_include= /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/include 
sniper_python_path=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/$(tag)/lib
offline_python_path=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/$(tag)/lib
calibRec_juno_python_path=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/$(calibRec_juno_installarea_prefix)/$(tag)/lib
sniper_install_python=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/python
offline_install_python=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/python
calibRec_juno_install_python=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/$(calibRec_juno_installarea_prefix)/python
CMTINSTALLAREA=/afs/ihep.ac.cn/users/y/yumiao/junofs/reconstruction/dev_juno/git_repo/calibRec_juno/$(cmt_installarea_prefix)
use_requirements=requirements $(CMT_root)/mgr/requirements $(SniperRelease_root)/cmt/requirements $(DataBuffer_root)/cmt/requirements $(HelloWorld_root)/cmt/requirements $(DummyAlg_root)/cmt/requirements $(RootWriter_root)/cmt/requirements $(ElecEvent_root)/cmt/requirements $(CalibEvent_root)/cmt/requirements $(RootIOSvc_root)/cmt/requirements $(RootIOUtil_root)/cmt/requirements $(EvtNavigator_root)/cmt/requirements $(DataRegistritionSvc_root)/cmt/requirements $(EDMUtil_root)/cmt/requirements $(Identifier_root)/cmt/requirements $(PMTCalibSvc_root)/cmt/requirements $(SniperKernel_root)/cmt/requirements $(BaseEvent_root)/cmt/requirements $(XmlObjDesc_root)/cmt/requirements $(Context_root)/cmt/requirements $(SniperPolicy_root)/cmt/requirements $(Boost_root)/cmt/requirements $(Python_root)/cmt/requirements $(ROOT_root)/cmt/requirements $(CLHEP_root)/cmt/requirements 
use_includes= $(ppcmd)"$(SniperRelease_root)/src" $(ppcmd)"$(DataBuffer_root)/src" $(ppcmd)"$(HelloWorld_root)/src" $(ppcmd)"$(DummyAlg_root)/src" $(ppcmd)"$(RootWriter_root)/src" $(ppcmd)"$(ElecEvent_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/ElecEvent/Event" $(ppcmd)"$(CalibEvent_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/CalibEvent/Event" $(ppcmd)"$(RootIOSvc_root)/src" $(ppcmd)"$(RootIOUtil_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/RootIO/RootIOUtil/RootIOUtil" $(ppcmd)"$(EvtNavigator_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EvtNavigator/EvtNavigator" $(ppcmd)"$(DataRegistritionSvc_root)/src" $(ppcmd)"$(EDMUtil_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EDMUtil/include" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EDMUtil/EDMUtil" $(ppcmd)"$(Identifier_root)/src" $(ppcmd)"$(PMTCalibSvc_root)/src" $(ppcmd)"$(SniperKernel_root)/src" $(ppcmd)"$(BaseEvent_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/BaseEvent/Event" $(ppcmd)"$(Context_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/Context/Context" $(ppcmd)"$(SniperPolicy_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Boost/1.65.1/include" $(ppcmd)"$(Python_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/include" $(ppcmd)"$(CLHEP_root)/src" 
use_fincludes= $(use_includes)
use_stamps=  $(PMTCalibAlg_stamps)  $(SniperRelease_stamps)  $(DataBuffer_stamps)  $(HelloWorld_stamps)  $(DummyAlg_stamps)  $(RootWriter_stamps)  $(ElecEvent_stamps)  $(CalibEvent_stamps)  $(RootIOSvc_stamps)  $(RootIOUtil_stamps)  $(EvtNavigator_stamps)  $(DataRegistritionSvc_stamps)  $(EDMUtil_stamps)  $(Identifier_stamps)  $(PMTCalibSvc_stamps)  $(SniperKernel_stamps)  $(BaseEvent_stamps)  $(Context_stamps)  $(SniperPolicy_stamps)  $(Boost_stamps)  $(Python_stamps)  $(ROOT_stamps)  $(CLHEP_stamps) 
use_cflags=  $(PMTCalibAlg_cflags)  $(SniperRelease_cflags)  $(DataBuffer_cflags)  $(HelloWorld_cflags)  $(DummyAlg_cflags)  $(RootWriter_cflags)  $(ElecEvent_cflags)  $(CalibEvent_cflags)  $(RootIOSvc_cflags)  $(RootIOUtil_cflags)  $(EvtNavigator_cflags)  $(DataRegistritionSvc_cflags)  $(EDMUtil_cflags)  $(Identifier_cflags)  $(PMTCalibSvc_cflags)  $(SniperKernel_cflags)  $(BaseEvent_cflags)  $(Context_cflags)  $(SniperPolicy_cflags)  $(Boost_cflags)  $(Python_cflags)  $(ROOT_cflags)  $(CLHEP_cflags) 
use_pp_cflags=  $(PMTCalibAlg_pp_cflags)  $(SniperRelease_pp_cflags)  $(DataBuffer_pp_cflags)  $(HelloWorld_pp_cflags)  $(DummyAlg_pp_cflags)  $(RootWriter_pp_cflags)  $(ElecEvent_pp_cflags)  $(CalibEvent_pp_cflags)  $(RootIOSvc_pp_cflags)  $(RootIOUtil_pp_cflags)  $(EvtNavigator_pp_cflags)  $(DataRegistritionSvc_pp_cflags)  $(EDMUtil_pp_cflags)  $(Identifier_pp_cflags)  $(PMTCalibSvc_pp_cflags)  $(SniperKernel_pp_cflags)  $(BaseEvent_pp_cflags)  $(Context_pp_cflags)  $(SniperPolicy_pp_cflags)  $(Boost_pp_cflags)  $(Python_pp_cflags)  $(ROOT_pp_cflags)  $(CLHEP_pp_cflags) 
use_cppflags=  $(PMTCalibAlg_cppflags)  $(SniperRelease_cppflags)  $(DataBuffer_cppflags)  $(HelloWorld_cppflags)  $(DummyAlg_cppflags)  $(RootWriter_cppflags)  $(ElecEvent_cppflags)  $(CalibEvent_cppflags)  $(RootIOSvc_cppflags)  $(RootIOUtil_cppflags)  $(EvtNavigator_cppflags)  $(DataRegistritionSvc_cppflags)  $(EDMUtil_cppflags)  $(Identifier_cppflags)  $(PMTCalibSvc_cppflags)  $(SniperKernel_cppflags)  $(BaseEvent_cppflags)  $(Context_cppflags)  $(SniperPolicy_cppflags)  $(Boost_cppflags)  $(Python_cppflags)  $(ROOT_cppflags)  $(CLHEP_cppflags) 
use_pp_cppflags=  $(PMTCalibAlg_pp_cppflags)  $(SniperRelease_pp_cppflags)  $(DataBuffer_pp_cppflags)  $(HelloWorld_pp_cppflags)  $(DummyAlg_pp_cppflags)  $(RootWriter_pp_cppflags)  $(ElecEvent_pp_cppflags)  $(CalibEvent_pp_cppflags)  $(RootIOSvc_pp_cppflags)  $(RootIOUtil_pp_cppflags)  $(EvtNavigator_pp_cppflags)  $(DataRegistritionSvc_pp_cppflags)  $(EDMUtil_pp_cppflags)  $(Identifier_pp_cppflags)  $(PMTCalibSvc_pp_cppflags)  $(SniperKernel_pp_cppflags)  $(BaseEvent_pp_cppflags)  $(Context_pp_cppflags)  $(SniperPolicy_pp_cppflags)  $(Boost_pp_cppflags)  $(Python_pp_cppflags)  $(ROOT_pp_cppflags)  $(CLHEP_pp_cppflags) 
use_fflags=  $(PMTCalibAlg_fflags)  $(SniperRelease_fflags)  $(DataBuffer_fflags)  $(HelloWorld_fflags)  $(DummyAlg_fflags)  $(RootWriter_fflags)  $(ElecEvent_fflags)  $(CalibEvent_fflags)  $(RootIOSvc_fflags)  $(RootIOUtil_fflags)  $(EvtNavigator_fflags)  $(DataRegistritionSvc_fflags)  $(EDMUtil_fflags)  $(Identifier_fflags)  $(PMTCalibSvc_fflags)  $(SniperKernel_fflags)  $(BaseEvent_fflags)  $(Context_fflags)  $(SniperPolicy_fflags)  $(Boost_fflags)  $(Python_fflags)  $(ROOT_fflags)  $(CLHEP_fflags) 
use_pp_fflags=  $(PMTCalibAlg_pp_fflags)  $(SniperRelease_pp_fflags)  $(DataBuffer_pp_fflags)  $(HelloWorld_pp_fflags)  $(DummyAlg_pp_fflags)  $(RootWriter_pp_fflags)  $(ElecEvent_pp_fflags)  $(CalibEvent_pp_fflags)  $(RootIOSvc_pp_fflags)  $(RootIOUtil_pp_fflags)  $(EvtNavigator_pp_fflags)  $(DataRegistritionSvc_pp_fflags)  $(EDMUtil_pp_fflags)  $(Identifier_pp_fflags)  $(PMTCalibSvc_pp_fflags)  $(SniperKernel_pp_fflags)  $(BaseEvent_pp_fflags)  $(Context_pp_fflags)  $(SniperPolicy_pp_fflags)  $(Boost_pp_fflags)  $(Python_pp_fflags)  $(ROOT_pp_fflags)  $(CLHEP_pp_fflags) 
use_libraries= $(SniperRelease_libraries)  $(DataBuffer_libraries)  $(HelloWorld_libraries)  $(DummyAlg_libraries)  $(RootWriter_libraries)  $(ElecEvent_libraries)  $(CalibEvent_libraries)  $(RootIOSvc_libraries)  $(RootIOUtil_libraries)  $(EvtNavigator_libraries)  $(DataRegistritionSvc_libraries)  $(EDMUtil_libraries)  $(Identifier_libraries)  $(PMTCalibSvc_libraries)  $(SniperKernel_libraries)  $(BaseEvent_libraries)  $(XmlObjDesc_libraries)  $(Context_libraries)  $(SniperPolicy_libraries)  $(Boost_libraries)  $(Python_libraries)  $(ROOT_libraries)  $(CLHEP_libraries) 
fincludes= $(includes)
PMTCalibAlg_GUID={88BF15AB-5A2D-4bea-B64F-02752C2A1F4F}
make_GUID={88BF15AB-5A2D-4bea-B64F-02752C2A1F4F}
constituents= PMTCalibAlg 
all_constituents= $(constituents)
constituentsclean= PMTCalibAlgclean 
all_constituentsclean= $(constituentsclean)
cmt_actions_constituents= make 
cmt_actions_constituentsclean= makeclean 
PMTCalibAlgprototype_dependencies= $(PMTCalibAlgcompile_dependencies)