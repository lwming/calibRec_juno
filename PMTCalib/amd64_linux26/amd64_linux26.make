CMTPATH=/junofs/users/yumiao/reconstruction/juno_wr:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
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
PATH=/junofs/users/yumiao/reconstruction/juno_wr/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26/${CMTBIN}:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-cpp/1.1.8/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-c/6.1.9/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/libmore/0.8.3/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Geant4/10.04.p02/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/HepMC/2.06.09/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/CLHEP/2.4.0.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/tbb/2017/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/fftw3/3.3.7/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/gsl/1.16/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Xercesc/3.1.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Cmake/3.9.6/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Boost/1.65.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Python/2.7.15/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/binutils/2.28/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/gcc/4.9.4/bin:/usr/lib64/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/bin:/usr/bin:/usr/externals/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/sbin:/usr/java/latest/bin:/opt/puppetlabs/bin:/afs/ihep.ac.cn/soft/common/sysgroup/hep_job/bin/
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
PMTCalib_tag=$(tag)
PMTCALIBROOT=/junofs/users/yumiao/reconstruction/juno_wr/Calibration/PMTCalib
PMTCalib_root=/junofs/users/yumiao/reconstruction/juno_wr/Calibration/PMTCalib
PMTCALIBVERSION=v0
PMTCalib_cmtpath=/junofs/users/yumiao/reconstruction/juno_wr
PMTCalib_offset=Calibration
PMTCalib_project=juno_wr
SniperKernel_tag=$(tag)
SNIPERKERNELROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperKernel
SniperKernel_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperKernel
SNIPERKERNELVERSION=v2
SniperKernel_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
SniperKernel_project=sniper
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
Boost_linkopts= -L$(Boost_home)/lib  -lboost_python 
includes= $(ppcmd)"$(srcdir)" $(ppcmd)"/junofs/users/yumiao/reconstruction/juno_wr/InstallArea/include" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/include" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/include" $(use_includes)
PYTHONPATH=/junofs/users/yumiao/reconstruction/juno_wr/InstallArea/python:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/python:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/python:/junofs/users/yumiao/reconstruction/juno_wr/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Python/2.7.15/lib/./python2.7/lib-dynload:/usr/lib64/python
SniperKernel_linkopts= -lSniperKernel  -lSniperPython 
SniperKernel_stamps=${SNIPERKERNELROOT}/${BINDIR}/SniperPython.stamp 
SniperKernel_linker_library=SniperPython
SniperPython_dependencies=SniperKernel
SniperPython_shlibflags= -lSniperKernel 
ROOT_tag=$(tag)
ROOTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/ROOT
ROOT_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/ROOT
ROOTVERSION=v0
ROOT_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
ROOT_offset=Externals
ROOT_project=ExternalInterface
ROOT_home=${JUNO_EXTLIB_ROOT_HOME}
ROOT_cppflags=`root-config --cflags` -Wno-long-long 
ROOT_linkopts=`root-config --evelibs` -lPyROOT 
rootcint="$(ROOT_home)/bin/rootcint"
RootWriter_tag=$(tag)
ROOTWRITERROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperSvc/RootWriter
RootWriter_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/SniperSvc/RootWriter
ROOTWRITERVERSION=v0
RootWriter_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
RootWriter_offset=SniperSvc
RootWriter_project=sniper
RootWriter_linkopts= -lRootWriter 
RootWriter_stamps=${ROOTWRITERROOT}/${BINDIR}/RootWriter.stamp 
RootWriter_linker_library=RootWriter
EvtNavigator_tag=$(tag)
EVTNAVIGATORROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EvtNavigator
EvtNavigator_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EvtNavigator
EVTNAVIGATORVERSION=v0
EvtNavigator_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
EvtNavigator_offset=DataModel
EvtNavigator_project=offline
BaseEvent_tag=$(tag)
BASEEVENTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/BaseEvent
BaseEvent_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/BaseEvent
BASEEVENTVERSION=v0
BaseEvent_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
BaseEvent_offset=DataModel
BaseEvent_project=offline
XmlObjDesc_tag=$(tag)
XMLOBJDESCROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/XmlObjDesc
XmlObjDesc_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/XmlObjDesc
XMLOBJDESCVERSION=v0
XmlObjDesc_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
XmlObjDesc_project=offline
xmlsrc=xml
XODflags= -n JM  -n JM 
BaseEvent_dependencies= BaseEventObj2Doth  BaseEventDict  BaseEventxodsrc 
install_more_includes_dependencies= BaseEventObj2Doth  ElecEventObj2Doth 
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
ElecEvent_tag=$(tag)
ELECEVENTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/ElecEvent
ElecEvent_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/ElecEvent
ELECEVENTVERSION=v0
ElecEvent_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
ElecEvent_offset=DataModel
ElecEvent_project=offline
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
PMTCalib_linkopts= -lPMTCalib 
PMTCalib_shlibflags=$(libraryshr_linkopts) $(cmt_installarea_linkopts) $(PMTCalib_use_linkopts)
PMTCalib_use_linkopts=    $(RootWriter_linkopts)  $(EvtNavigator_linkopts)  $(DataRegistritionSvc_linkopts)  $(ElecEvent_linkopts)  $(EDMUtil_linkopts)  $(SniperKernel_linkopts)  $(BaseEvent_linkopts)  $(Context_linkopts)  $(SniperPolicy_linkopts)  $(Boost_linkopts)  $(Python_linkopts)  $(ROOT_linkopts) 
PMTCalib_stamps=${PMTCALIBROOT}/${BINDIR}/PMTCalib.stamp 
PMTCalib_linker_library=PMTCalib
tag=amd64_linux26
package=PMTCalib
version=v0
PACKAGE_ROOT=$(PMTCALIBROOT)
srcdir=../src
bin=../$(PMTCalib_tag)/
javabin=../classes/
mgrdir=cmt
BIN=/junofs/users/yumiao/reconstruction/juno_wr/Calibration/PMTCalib/amd64_linux26/
project=juno_wr
cmt_installarea_paths= $(cmt_installarea_prefix)/$(CMTCONFIG)/bin $(sniper_installarea_prefix)/$(CMTCONFIG)/lib $(sniper_installarea_prefix)/share/lib $(sniper_installarea_prefix)/share/bin $(offline_installarea_prefix)/$(CMTCONFIG)/lib $(offline_installarea_prefix)/share/lib $(offline_installarea_prefix)/share/bin $(juno_wr_installarea_prefix)/$(CMTCONFIG)/lib $(juno_wr_installarea_prefix)/share/lib $(juno_wr_installarea_prefix)/share/bin
use_linkopts= $(cmt_installarea_linkopts)   $(PMTCalib_linkopts)  $(RootWriter_linkopts)  $(EvtNavigator_linkopts)  $(DataRegistritionSvc_linkopts)  $(ElecEvent_linkopts)  $(EDMUtil_linkopts)  $(SniperKernel_linkopts)  $(BaseEvent_linkopts)  $(Context_linkopts)  $(SniperPolicy_linkopts)  $(Boost_linkopts)  $(Python_linkopts)  $(ROOT_linkopts) 
ExternalInterface_installarea_prefix=$(cmt_installarea_prefix)
ExternalInterface_installarea_prefix_remove=$(ExternalInterface_installarea_prefix)
LD_LIBRARY_PATH=/junofs/users/yumiao/reconstruction/juno_wr/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-cpp/1.1.8/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-c/6.1.9/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/libmore/0.8.3/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Geant4/10.04.p02/lib64:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/HepMC/2.06.09/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/CLHEP/2.4.0.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/tbb/2017/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/fftw3/3.3.7/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/gsl/1.16/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Xercesc/3.1.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Boost/1.65.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Python/2.7.15/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/binutils/2.28/lib64:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/binutils/2.28/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/gcc/4.9.4/lib64:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/gcc/4.9.4/lib:/usr/lib64/classads:/usr/lib64:/usr/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/Xercesc/3.1.1/lib
sniper_installarea_prefix=$(cmt_installarea_prefix)
sniper_installarea_prefix_remove=$(sniper_installarea_prefix)
offline_installarea_prefix=$(cmt_installarea_prefix)
offline_installarea_prefix_remove=$(offline_installarea_prefix)
juno_wr_installarea_prefix=$(cmt_installarea_prefix)
juno_wr_installarea_prefix_remove=$(juno_wr_installarea_prefix)
cmt_installarea_linkopts= -L/junofs/users/yumiao/reconstruction/juno_wr/$(juno_wr_installarea_prefix)/$(CMTCONFIG)/lib  -L/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/$(CMTCONFIG)/lib  -L/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/$(CMTCONFIG)/lib 
ExternalInterface_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
sniper_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
offline_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
juno_wr_home=/junofs/users/yumiao/reconstruction/juno_wr
juno_wr_install_include= /junofs/users/yumiao/reconstruction/juno_wr/$(juno_wr_installarea_prefix)/include 
offline_install_include= /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/include 
sniper_install_include= /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/include 
sniper_python_path=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/$(tag)/lib
offline_python_path=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/$(tag)/lib
juno_wr_python_path=/junofs/users/yumiao/reconstruction/juno_wr/$(juno_wr_installarea_prefix)/$(tag)/lib
sniper_install_python=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/python
offline_install_python=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/python
juno_wr_install_python=/junofs/users/yumiao/reconstruction/juno_wr/$(juno_wr_installarea_prefix)/python
CMTINSTALLAREA=/junofs/users/yumiao/reconstruction/juno_wr/$(cmt_installarea_prefix)
use_requirements=requirements $(CMT_root)/mgr/requirements $(RootWriter_root)/cmt/requirements $(EvtNavigator_root)/cmt/requirements $(DataRegistritionSvc_root)/cmt/requirements $(ElecEvent_root)/cmt/requirements $(EDMUtil_root)/cmt/requirements $(SniperKernel_root)/cmt/requirements $(BaseEvent_root)/cmt/requirements $(XmlObjDesc_root)/cmt/requirements $(Context_root)/cmt/requirements $(SniperPolicy_root)/cmt/requirements $(Boost_root)/cmt/requirements $(Python_root)/cmt/requirements $(ROOT_root)/cmt/requirements 
use_includes= $(ppcmd)"$(RootWriter_root)/src" $(ppcmd)"$(EvtNavigator_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EvtNavigator/EvtNavigator" $(ppcmd)"$(DataRegistritionSvc_root)/src" $(ppcmd)"$(ElecEvent_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/ElecEvent/Event" $(ppcmd)"$(EDMUtil_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EDMUtil/include" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/EDMUtil/EDMUtil" $(ppcmd)"$(SniperKernel_root)/src" $(ppcmd)"$(BaseEvent_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/BaseEvent/Event" $(ppcmd)"$(Context_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/DataModel/Context/Context" $(ppcmd)"$(SniperPolicy_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Boost/1.65.1/include" $(ppcmd)"$(Python_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/include" 
use_fincludes= $(use_includes)
use_stamps=  $(PMTCalib_stamps)  $(RootWriter_stamps)  $(EvtNavigator_stamps)  $(DataRegistritionSvc_stamps)  $(ElecEvent_stamps)  $(EDMUtil_stamps)  $(SniperKernel_stamps)  $(BaseEvent_stamps)  $(Context_stamps)  $(SniperPolicy_stamps)  $(Boost_stamps)  $(Python_stamps)  $(ROOT_stamps) 
use_cflags=  $(PMTCalib_cflags)  $(RootWriter_cflags)  $(EvtNavigator_cflags)  $(DataRegistritionSvc_cflags)  $(ElecEvent_cflags)  $(EDMUtil_cflags)  $(SniperKernel_cflags)  $(BaseEvent_cflags)  $(Context_cflags)  $(SniperPolicy_cflags)  $(Boost_cflags)  $(Python_cflags)  $(ROOT_cflags) 
use_pp_cflags=  $(PMTCalib_pp_cflags)  $(RootWriter_pp_cflags)  $(EvtNavigator_pp_cflags)  $(DataRegistritionSvc_pp_cflags)  $(ElecEvent_pp_cflags)  $(EDMUtil_pp_cflags)  $(SniperKernel_pp_cflags)  $(BaseEvent_pp_cflags)  $(Context_pp_cflags)  $(SniperPolicy_pp_cflags)  $(Boost_pp_cflags)  $(Python_pp_cflags)  $(ROOT_pp_cflags) 
use_cppflags=  $(PMTCalib_cppflags)  $(RootWriter_cppflags)  $(EvtNavigator_cppflags)  $(DataRegistritionSvc_cppflags)  $(ElecEvent_cppflags)  $(EDMUtil_cppflags)  $(SniperKernel_cppflags)  $(BaseEvent_cppflags)  $(Context_cppflags)  $(SniperPolicy_cppflags)  $(Boost_cppflags)  $(Python_cppflags)  $(ROOT_cppflags) 
use_pp_cppflags=  $(PMTCalib_pp_cppflags)  $(RootWriter_pp_cppflags)  $(EvtNavigator_pp_cppflags)  $(DataRegistritionSvc_pp_cppflags)  $(ElecEvent_pp_cppflags)  $(EDMUtil_pp_cppflags)  $(SniperKernel_pp_cppflags)  $(BaseEvent_pp_cppflags)  $(Context_pp_cppflags)  $(SniperPolicy_pp_cppflags)  $(Boost_pp_cppflags)  $(Python_pp_cppflags)  $(ROOT_pp_cppflags) 
use_fflags=  $(PMTCalib_fflags)  $(RootWriter_fflags)  $(EvtNavigator_fflags)  $(DataRegistritionSvc_fflags)  $(ElecEvent_fflags)  $(EDMUtil_fflags)  $(SniperKernel_fflags)  $(BaseEvent_fflags)  $(Context_fflags)  $(SniperPolicy_fflags)  $(Boost_fflags)  $(Python_fflags)  $(ROOT_fflags) 
use_pp_fflags=  $(PMTCalib_pp_fflags)  $(RootWriter_pp_fflags)  $(EvtNavigator_pp_fflags)  $(DataRegistritionSvc_pp_fflags)  $(ElecEvent_pp_fflags)  $(EDMUtil_pp_fflags)  $(SniperKernel_pp_fflags)  $(BaseEvent_pp_fflags)  $(Context_pp_fflags)  $(SniperPolicy_pp_fflags)  $(Boost_pp_fflags)  $(Python_pp_fflags)  $(ROOT_pp_fflags) 
use_libraries= $(RootWriter_libraries)  $(EvtNavigator_libraries)  $(DataRegistritionSvc_libraries)  $(ElecEvent_libraries)  $(EDMUtil_libraries)  $(SniperKernel_libraries)  $(BaseEvent_libraries)  $(XmlObjDesc_libraries)  $(Context_libraries)  $(SniperPolicy_libraries)  $(Boost_libraries)  $(Python_libraries)  $(ROOT_libraries) 
fincludes= $(includes)
PMTCalib_GUID={88BF15AB-5A2D-4bea-B64F-02752C2A1F4F}
make_GUID={88BF15AB-5A2D-4bea-B64F-02752C2A1F4F}
constituents= PMTCalib 
all_constituents= $(constituents)
constituentsclean= PMTCalibclean 
all_constituentsclean= $(constituentsclean)
cmt_actions_constituents= make 
cmt_actions_constituentsclean= makeclean 
PMTCalibprototype_dependencies= $(PMTCalibcompile_dependencies)