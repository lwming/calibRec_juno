<<<<<<< HEAD
CMTPATH=/junofs/users/huangx/HXProject/MyProject:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/offline:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalInterface
CMT_tag=$(tag)
CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Release/J17v1r1/ExternalLibs/CMT/v1r26
CMT_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Release/J17v1r1/ExternalLibs/CMT/v1r26
CMTVERSION=v1r26
CMT_offset=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Release/J17v1r1/ExternalLibs
=======
CMTPATH=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
CMT_tag=$(tag)
CMTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26
CMT_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26
CMTVERSION=v1r26
CMT_offset=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs
>>>>>>> feature-ym
cmt_hardware_query_command=uname -m
cmt_hardware=`$(cmt_hardware_query_command)`
cmt_system_version_query_command=${CMTROOT}/mgr/cmt_linux_version.sh | ${CMTROOT}/mgr/cmt_filter_version.sh
cmt_system_version=`$(cmt_system_version_query_command)`
cmt_compiler_version_query_command=${CMTROOT}/mgr/cmt_gcc_version.sh | ${CMTROOT}/mgr/cmt_filter3_version.sh
cmt_compiler_version=`$(cmt_compiler_version_query_command)`
<<<<<<< HEAD
PATH=/junofs/users/huangx/HXProject/MyProject/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/offline/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Release/J17v1r1/ExternalLibs/CMT/v1r26/${CMTBIN}:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/mysql-connector-cpp/1.1.8/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/mysql-connector-c/6.1.9/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/libmore/0.8.3/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/Geant4/9.4.p04/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/HepMC/2.06.09/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/ROOT/5.34.11/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/CLHEP/2.1.0.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/fftw3/3.2.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/gsl/1.16/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/Xercesc/3.1.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/Cmake/2.8.12.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/Boost/1.55.0/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/Python/2.7.6/bin:/usr/lib64/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/bin:/usr/bin:/usr/externals/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/sbin:/usr/java/latest/bin:/opt/puppetlabs/bin:/afs/ihep.ac.cn/soft/common/sysgroup/hep_job/bin
CLASSPATH=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Release/J17v1r1/ExternalLibs/CMT/v1r26/java
=======
PATH=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/${CMTCONFIG}/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26/${CMTBIN}:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-cpp/1.1.8/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-c/6.1.9/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/libmore/0.8.3/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Geant4/10.04.p02/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/HepMC/2.06.09/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/CLHEP/2.4.0.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/tbb/2017/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/fftw3/3.3.7/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/gsl/1.16/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Xercesc/3.1.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Cmake/3.9.6/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Boost/1.65.1/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Python/2.7.15/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/binutils/2.28/bin:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/gcc/4.9.4/bin:/usr/lib64/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/bin:/usr/bin:/usr/externals/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/sbin:/usr/java/latest/bin:/opt/puppetlabs/bin:/afs/ihep.ac.cn/soft/common/sysgroup/hep_job/bin/
CLASSPATH=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/CMT/v1r26/java
>>>>>>> feature-ym
debug_option=-g
cc=gcc
ccomp=$(cc) -c $(includes) $(cdebugflags) $(cflags) $(pp_cflags)
clink=$(cc) $(clinkflags) $(cdebugflags)
ppcmd=-I
preproc=c++ -MD -c 
cpp=g++
<<<<<<< HEAD
cppflags=-O2 -fPIC -pipe -ansi -W -Wall -Wwrite-strings -Wpointer-arith -Woverloaded-virtual 
=======
cppflags=-std=c++11 -fPIC -pipe -W -Wall -Wwrite-strings -Wpointer-arith -Woverloaded-virtual 
>>>>>>> feature-ym
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
<<<<<<< HEAD
NEWCMTCONFIG=x86_64-sl69-gcc447
PMTCalibSvc_tag=$(tag)
PMTCALIBSVCROOT=/junofs/users/huangx/HXProject/MyProject/PMTCalibSvc
PMTCalibSvc_root=/junofs/users/huangx/HXProject/MyProject/PMTCalibSvc
PMTCALIBSVCVERSION=v0
PMTCalibSvc_cmtpath=/junofs/users/huangx/HXProject/MyProject
PMTCalibSvc_project=MyProject
SniperKernel_tag=$(tag)
SNIPERKERNELROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/SniperKernel
SniperKernel_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/SniperKernel
SNIPERKERNELVERSION=v2
SniperKernel_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper
SniperKernel_project=sniper
SniperPolicy_tag=$(tag)
SNIPERPOLICYROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/SniperPolicy
SniperPolicy_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/SniperPolicy
SNIPERPOLICYVERSION=v0
SniperPolicy_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper
=======
NEWCMTCONFIG=x86_64-sl69-gcc494
PMTCalibSvc_tag=$(tag)
PMTCALIBSVCROOT=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/PMTCalibSvc
PMTCalibSvc_root=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/PMTCalibSvc
PMTCALIBSVCVERSION=v0
PMTCalibSvc_cmtpath=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno
PMTCalibSvc_project=calibRec_juno
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
>>>>>>> feature-ym
SniperPolicy_project=sniper
libraryshr_linkopts=-fPIC -ldl -Wl,--as-needed -Wl,--no-undefined 
application_linkopts=-Wl,--export-dynamic 
BINDIR=$(tag)
remove_command=$(cmt_uninstallarea_command)
Boost_tag=$(tag)
<<<<<<< HEAD
BOOSTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalInterface/Externals/Boost
Boost_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalInterface/Externals/Boost
BOOSTVERSION=v0
Boost_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalInterface
Boost_offset=Externals
Boost_project=ExternalInterface
Python_tag=$(tag)
PYTHONROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalInterface/Externals/Python
Python_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalInterface/Externals/Python
PYTHONVERSION=v0
Python_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalInterface
=======
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
>>>>>>> feature-ym
Python_offset=Externals
Python_project=ExternalInterface
Python_linkopts= `pkg-config --libs python` 
Python_cppflags= `pkg-config --cflags python` 
Boost_home=${JUNO_EXTLIB_Boost_HOME}
Boost_linkopts= -L$(Boost_home)/lib  -lboost_python  -lboost_filesystem -lboost_system 
<<<<<<< HEAD
includes= $(ppcmd)"$(PMTCalibSvc_root)"  $(ppcmd)"$(srcdir)" $(ppcmd)"/junofs/users/huangx/HXProject/MyProject/InstallArea/include" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/offline/InstallArea/include" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/InstallArea/include" $(use_includes)
PYTHONPATH=/junofs/users/huangx/HXProject/MyProject/InstallArea/python:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/offline/InstallArea/python:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/InstallArea/python:/junofs/users/huangx/HXProject/MyProject/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/offline/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/ROOT/5.34.11/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/Python/2.7.6/lib/./python2.7/lib-dynload:/usr/lib64/python
=======
includes= $(ppcmd)"$(PMTCalibSvc_root)"  $(ppcmd)"$(srcdir)" $(ppcmd)"/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/InstallArea/include" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/include" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/include" $(use_includes)
PYTHONPATH=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/InstallArea/python:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/python:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/python:/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/amd64_linux26/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Python/2.7.15/lib/./python2.7/lib-dynload:/usr/lib64/python
>>>>>>> feature-ym
SniperKernel_linkopts= -lSniperKernel  -lSniperPython 
SniperKernel_stamps=${SNIPERKERNELROOT}/${BINDIR}/SniperPython.stamp 
SniperKernel_linker_library=SniperPython
SniperPython_dependencies=SniperKernel
SniperPython_shlibflags= -lSniperKernel 
ROOT_tag=$(tag)
<<<<<<< HEAD
ROOTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalInterface/Externals/ROOT
ROOT_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalInterface/Externals/ROOT
ROOTVERSION=v0
ROOT_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalInterface
=======
ROOTROOT=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/ROOT
ROOT_root=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface/Externals/ROOT
ROOTVERSION=v0
ROOT_cmtpath=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
>>>>>>> feature-ym
ROOT_offset=Externals
ROOT_project=ExternalInterface
ROOT_home=${JUNO_EXTLIB_ROOT_HOME}
ROOT_cppflags=`root-config --cflags` -Wno-long-long 
<<<<<<< HEAD
ROOT_linkopts= -Wl,--no-as-needed `root-config --evelibs` -Wl,--as-needed  -lUnuran 
=======
ROOT_linkopts= -Wl,--no-as-needed `root-config --evelibs` -Wl,--as-needed 
>>>>>>> feature-ym
rootcint="$(ROOT_home)/bin/rootcint"
PMTCalibSvc_linkopts= -lPMTCalibSvc 
PMTCalibSvc_shlibflags=$(libraryshr_linkopts) $(cmt_installarea_linkopts) $(PMTCalibSvc_use_linkopts)
PMTCalibSvc_use_linkopts=    $(SniperKernel_linkopts)  $(SniperPolicy_linkopts)  $(Boost_linkopts)  $(Python_linkopts)  $(ROOT_linkopts) 
PMTCalibSvc_stamps=${PMTCALIBSVCROOT}/${BINDIR}/PMTCalibSvc.stamp 
PMTCalibSvc_linker_library=PMTCalibSvc
tag=amd64_linux26
package=PMTCalibSvc
version=v0
PACKAGE_ROOT=$(PMTCALIBSVCROOT)
srcdir=../src
bin=../$(PMTCalibSvc_tag)/
javabin=../classes/
mgrdir=cmt
<<<<<<< HEAD
BIN=/junofs/users/huangx/HXProject/MyProject/PMTCalibSvc/amd64_linux26/
project=MyProject
cmt_installarea_paths= $(cmt_installarea_prefix)/$(CMTCONFIG)/bin $(sniper_installarea_prefix)/$(CMTCONFIG)/lib $(sniper_installarea_prefix)/share/lib $(sniper_installarea_prefix)/share/bin $(offline_installarea_prefix)/$(CMTCONFIG)/lib $(offline_installarea_prefix)/share/lib $(offline_installarea_prefix)/share/bin $(MyProject_installarea_prefix)/$(CMTCONFIG)/lib $(MyProject_installarea_prefix)/share/lib $(MyProject_installarea_prefix)/share/bin
use_linkopts= $(cmt_installarea_linkopts)   $(PMTCalibSvc_linkopts)  $(SniperKernel_linkopts)  $(SniperPolicy_linkopts)  $(Boost_linkopts)  $(Python_linkopts)  $(ROOT_linkopts) 
ExternalInterface_installarea_prefix=$(cmt_installarea_prefix)
ExternalInterface_installarea_prefix_remove=$(ExternalInterface_installarea_prefix)
LD_LIBRARY_PATH=/junofs/users/huangx/HXProject/MyProject/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/offline/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/mysql-connector-cpp/1.1.8/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/mysql-connector-c/6.1.9/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/libmore/0.8.3/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Release/J17v1r1/ExternalLibs/Geant4/9.4.p04/lib/geant4-9.4.4/Linux-g++:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Release/J17v1r1/ExternalLibs/CLHEP/2.1.0.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/Geant4/9.4.p04/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/HepMC/2.06.09/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/ROOT/5.34.11/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/CLHEP/2.1.0.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/fftw3/3.2.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/gsl/1.16/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/Xercesc/3.1.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/Boost/1.55.0/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/Python/2.7.6/lib:/usr/lib64/classads:/usr/lib64:/usr/lib
=======
BIN=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/PMTCalibSvc/amd64_linux26/
project=calibRec_juno
cmt_installarea_paths= $(cmt_installarea_prefix)/$(CMTCONFIG)/bin $(sniper_installarea_prefix)/$(CMTCONFIG)/lib $(sniper_installarea_prefix)/share/lib $(sniper_installarea_prefix)/share/bin $(offline_installarea_prefix)/$(CMTCONFIG)/lib $(offline_installarea_prefix)/share/lib $(offline_installarea_prefix)/share/bin $(calibRec_juno_installarea_prefix)/$(CMTCONFIG)/lib $(calibRec_juno_installarea_prefix)/share/lib $(calibRec_juno_installarea_prefix)/share/bin
use_linkopts= $(cmt_installarea_linkopts)   $(PMTCalibSvc_linkopts)  $(SniperKernel_linkopts)  $(SniperPolicy_linkopts)  $(Boost_linkopts)  $(Python_linkopts)  $(ROOT_linkopts) 
ExternalInterface_installarea_prefix=$(cmt_installarea_prefix)
ExternalInterface_installarea_prefix_remove=$(ExternalInterface_installarea_prefix)
LD_LIBRARY_PATH=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/InstallArea/${CMTCONFIG}/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-cpp/1.1.8/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/mysql-connector-c/6.1.9/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/libmore/0.8.3/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Geant4/10.04.p02/lib64:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/HepMC/2.06.09/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/CLHEP/2.4.0.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/tbb/2017/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/fftw3/3.3.7/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/gsl/1.16/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Xercesc/3.1.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Boost/1.65.1/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Python/2.7.15/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/binutils/2.28/lib64:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/binutils/2.28/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/gcc/4.9.4/lib64:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/contrib/gcc/4.9.4/lib:/usr/lib64/classads:/usr/lib64:/usr/lib:/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs/Xercesc/3.1.1/lib
>>>>>>> feature-ym
sniper_installarea_prefix=$(cmt_installarea_prefix)
sniper_installarea_prefix_remove=$(sniper_installarea_prefix)
offline_installarea_prefix=$(cmt_installarea_prefix)
offline_installarea_prefix_remove=$(offline_installarea_prefix)
<<<<<<< HEAD
MyProject_installarea_prefix=$(cmt_installarea_prefix)
MyProject_installarea_prefix_remove=$(MyProject_installarea_prefix)
cmt_installarea_linkopts= -L/junofs/users/huangx/HXProject/MyProject/$(MyProject_installarea_prefix)/$(CMTCONFIG)/lib  -L/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/offline/$(offline_installarea_prefix)/$(CMTCONFIG)/lib  -L/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/$(sniper_installarea_prefix)/$(CMTCONFIG)/lib 
ExternalInterface_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalInterface
sniper_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper
offline_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/offline
MyProject_home=/junofs/users/huangx/HXProject/MyProject
MyProject_install_include= /junofs/users/huangx/HXProject/MyProject/$(MyProject_installarea_prefix)/include 
offline_install_include= /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/offline/$(offline_installarea_prefix)/include 
sniper_install_include= /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/$(sniper_installarea_prefix)/include 
sniper_python_path=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/$(sniper_installarea_prefix)/$(tag)/lib
offline_python_path=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/offline/$(offline_installarea_prefix)/$(tag)/lib
MyProject_python_path=/junofs/users/huangx/HXProject/MyProject/$(MyProject_installarea_prefix)/$(tag)/lib
sniper_install_python=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/sniper/$(sniper_installarea_prefix)/python
offline_install_python=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/offline/$(offline_installarea_prefix)/python
MyProject_install_python=/junofs/users/huangx/HXProject/MyProject/$(MyProject_installarea_prefix)/python
CMTINSTALLAREA=/junofs/users/huangx/HXProject/MyProject/$(cmt_installarea_prefix)
use_requirements=requirements $(CMT_root)/mgr/requirements $(SniperKernel_root)/cmt/requirements $(SniperPolicy_root)/cmt/requirements $(Boost_root)/cmt/requirements $(Python_root)/cmt/requirements $(ROOT_root)/cmt/requirements 
use_includes= $(ppcmd)"$(SniperKernel_root)/src" $(ppcmd)"$(SniperPolicy_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/Boost/1.55.0/include" $(ppcmd)"$(Python_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v1r1-Pre1/ExternalLibs/ROOT/5.34.11/include" 
=======
calibRec_juno_installarea_prefix=$(cmt_installarea_prefix)
calibRec_juno_installarea_prefix_remove=$(calibRec_juno_installarea_prefix)
cmt_installarea_linkopts= -L/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/$(calibRec_juno_installarea_prefix)/$(CMTCONFIG)/lib  -L/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/$(CMTCONFIG)/lib  -L/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/$(CMTCONFIG)/lib 
ExternalInterface_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface
sniper_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper
offline_home=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline
calibRec_juno_home=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno
calibRec_juno_install_include= /junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/$(calibRec_juno_installarea_prefix)/include 
offline_install_include= /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/include 
sniper_install_include= /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/include 
sniper_python_path=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/$(tag)/lib
offline_python_path=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/$(tag)/lib
calibRec_juno_python_path=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/$(calibRec_juno_installarea_prefix)/$(tag)/lib
sniper_install_python=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper/$(sniper_installarea_prefix)/python
offline_install_python=/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline/$(offline_installarea_prefix)/python
calibRec_juno_install_python=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/$(calibRec_juno_installarea_prefix)/python
CMTINSTALLAREA=/junofs/users/yumiao/reconstruction/dev_juno/git_repo/calibRec_juno/$(cmt_installarea_prefix)
use_requirements=requirements $(CMT_root)/mgr/requirements $(SniperKernel_root)/cmt/requirements $(SniperPolicy_root)/cmt/requirements $(Boost_root)/cmt/requirements $(Python_root)/cmt/requirements $(ROOT_root)/cmt/requirements 
use_includes= $(ppcmd)"$(SniperKernel_root)/src" $(ppcmd)"$(SniperPolicy_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/Boost/1.65.1/include" $(ppcmd)"$(Python_root)/src" $(ppcmd)"/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalLibs/ROOT/6.12.06/include" 
>>>>>>> feature-ym
use_fincludes= $(use_includes)
use_stamps=  $(PMTCalibSvc_stamps)  $(SniperKernel_stamps)  $(SniperPolicy_stamps)  $(Boost_stamps)  $(Python_stamps)  $(ROOT_stamps) 
use_cflags=  $(PMTCalibSvc_cflags)  $(SniperKernel_cflags)  $(SniperPolicy_cflags)  $(Boost_cflags)  $(Python_cflags)  $(ROOT_cflags) 
use_pp_cflags=  $(PMTCalibSvc_pp_cflags)  $(SniperKernel_pp_cflags)  $(SniperPolicy_pp_cflags)  $(Boost_pp_cflags)  $(Python_pp_cflags)  $(ROOT_pp_cflags) 
use_cppflags=  $(PMTCalibSvc_cppflags)  $(SniperKernel_cppflags)  $(SniperPolicy_cppflags)  $(Boost_cppflags)  $(Python_cppflags)  $(ROOT_cppflags) 
use_pp_cppflags=  $(PMTCalibSvc_pp_cppflags)  $(SniperKernel_pp_cppflags)  $(SniperPolicy_pp_cppflags)  $(Boost_pp_cppflags)  $(Python_pp_cppflags)  $(ROOT_pp_cppflags) 
use_fflags=  $(PMTCalibSvc_fflags)  $(SniperKernel_fflags)  $(SniperPolicy_fflags)  $(Boost_fflags)  $(Python_fflags)  $(ROOT_fflags) 
use_pp_fflags=  $(PMTCalibSvc_pp_fflags)  $(SniperKernel_pp_fflags)  $(SniperPolicy_pp_fflags)  $(Boost_pp_fflags)  $(Python_pp_fflags)  $(ROOT_pp_fflags) 
use_libraries= $(SniperKernel_libraries)  $(SniperPolicy_libraries)  $(Boost_libraries)  $(Python_libraries)  $(ROOT_libraries) 
fincludes= $(includes)
PMTCalibSvc_GUID={88BF15AB-5A2D-4bea-B64F-02752C2A1F4F}
PMTCalibSvc_python_GUID={88BF15AB-5A2D-4bea-B64F-02752C2A1F4F}
install_more_includes_GUID={88BF15AB-5A2D-4bea-B64F-02752C2A1F4F}
make_GUID={88BF15AB-5A2D-4bea-B64F-02752C2A1F4F}
constituents= PMTCalibSvc PMTCalibSvc_python install_more_includes 
all_constituents= $(constituents)
constituentsclean= install_more_includesclean PMTCalibSvc_pythonclean PMTCalibSvcclean 
all_constituentsclean= $(constituentsclean)
cmt_actions_constituents= make 
cmt_actions_constituentsclean= makeclean 
PMTCalibSvcprototype_dependencies= $(PMTCalibSvccompile_dependencies)
