----------> uses
# use SniperKernel v*  (no_version_directory)
#   use SniperPolicy v*  (no_version_directory)
#   use Boost v* Externals (no_version_directory)
#     use Python v* Externals (no_version_directory)
# use ROOT v* Externals (no_version_directory)
# use Boost v* Externals (no_version_directory)
# use RootWriter v* SniperSvc (no_version_directory)
#   use SniperKernel v*  (no_version_directory)
#   use ROOT v* Externals (no_version_directory)
#   use Boost v* Externals (no_version_directory)
# use EvtNavigator v* DataModel (no_version_directory)
#   use ROOT v* Externals (no_version_directory)
#   use BaseEvent v* DataModel (no_version_directory)
#     use XmlObjDesc v*  (no_auto_imports) (no_version_directory)
#       use SniperPolicy v*  (no_version_directory)
#       use ROOT v* Externals (no_version_directory)
#     use ROOT v* Externals (no_version_directory)
#   use EDMUtil v* DataModel (no_version_directory)
#     use ROOT v* Externals (no_version_directory)
#     use BaseEvent v* DataModel (no_version_directory)
#     use SniperKernel v*  (no_version_directory)
# use DataRegistritionSvc v* DataModel (no_version_directory)
#   use SniperKernel v*  (no_version_directory)
#   use Boost v* Externals (no_version_directory)
#   use EDMUtil v* DataModel (no_version_directory)
# use ElecEvent v* DataModel (no_version_directory)
#   use XmlObjDesc v*  (no_auto_imports) (no_version_directory)
#   use SniperKernel v*  (no_version_directory)
#   use ROOT v* Externals (no_version_directory)
#   use BaseEvent v* DataModel (no_version_directory)
#   use EDMUtil v* DataModel (no_version_directory)
#   use Context v* DataModel (no_version_directory)
#     use SniperPolicy v*  (no_version_directory)
#     use ROOT v* Externals (no_version_directory)
#
# Selection :
use CMT v1r26 (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-branch/ExternalLibs)
use ROOT v0 Externals (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface)
use Python v0 Externals (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface)
use Boost v0 Externals (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface)
use SniperPolicy v0  (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper)
use Context v0 DataModel (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline)
use XmlObjDesc v0  (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline) (no_auto_imports)
use BaseEvent v0 DataModel (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline)
use SniperKernel v2  (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper)
use EDMUtil v0 DataModel (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline)
use ElecEvent v0 DataModel (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline)
use DataRegistritionSvc v0 DataModel (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline)
use EvtNavigator v0 DataModel (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline)
use RootWriter v0 SniperSvc (/afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper)
----------> tags
CMTv1 (from CMTVERSION)
CMTr26 (from CMTVERSION)
CMTp0 (from CMTVERSION)
Linux (from uname) package [CMT] implies [Unix]
amd64_linux26 (from CMTCONFIG)
juno_wr_no_config (from PROJECT) excludes [juno_wr_config]
juno_wr_root (from PROJECT) excludes [juno_wr_no_root]
juno_wr_cleanup (from PROJECT) excludes [juno_wr_no_cleanup]
juno_wr_scripts (from PROJECT) excludes [juno_wr_no_scripts]
juno_wr_prototypes (from PROJECT) excludes [juno_wr_no_prototypes]
juno_wr_with_installarea (from PROJECT) excludes [juno_wr_without_installarea]
juno_wr_without_version_directory (from PROJECT) excludes [juno_wr_with_version_directory]
offline_no_config (from PROJECT) excludes [offline_config]
offline_root (from PROJECT) excludes [offline_no_root]
offline_cleanup (from PROJECT) excludes [offline_no_cleanup]
offline_scripts (from PROJECT) excludes [offline_no_scripts]
offline_prototypes (from PROJECT) excludes [offline_no_prototypes]
offline_with_installarea (from PROJECT) excludes [offline_without_installarea]
offline_without_version_directory (from PROJECT) excludes [offline_with_version_directory]
sniper_no_config (from PROJECT) excludes [sniper_config]
sniper_root (from PROJECT) excludes [sniper_no_root]
sniper_cleanup (from PROJECT) excludes [sniper_no_cleanup]
sniper_scripts (from PROJECT) excludes [sniper_no_scripts]
sniper_prototypes (from PROJECT) excludes [sniper_no_prototypes]
sniper_with_installarea (from PROJECT) excludes [sniper_without_installarea]
sniper_without_version_directory (from PROJECT) excludes [sniper_with_version_directory]
ExternalInterface_no_config (from PROJECT) excludes [ExternalInterface_config]
ExternalInterface_no_root (from PROJECT) excludes [ExternalInterface_root]
ExternalInterface_cleanup (from PROJECT) excludes [ExternalInterface_no_cleanup]
ExternalInterface_scripts (from PROJECT) excludes [ExternalInterface_no_scripts]
ExternalInterface_prototypes (from PROJECT) excludes [ExternalInterface_no_prototypes]
ExternalInterface_without_installarea (from PROJECT) excludes [ExternalInterface_with_installarea]
ExternalInterface_without_version_directory (from PROJECT) excludes [ExternalInterface_with_version_directory]
juno_wr (from PROJECT)
x86_64 (from package CMT)
sl69 (from package CMT)
gcc494 (from package CMT)
Unix (from package CMT) excludes [WIN32 Win32]
----------> CMTPATH
# Add path /junofs/users/yumiao/reconstruction/juno_wr from initialization
# Add path /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/offline from ProjectPath
# Add path /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/sniper from ProjectPath
# Add path /afs/ihep.ac.cn/soft/juno/JUNO-ALL-SLC6/Pre-Release/J18v2r1-Pre4/ExternalInterface from ProjectPath
