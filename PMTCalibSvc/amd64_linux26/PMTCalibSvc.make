#-- start of make_header -----------------

#====================================
#  Library PMTCalibSvc
#
#   Generated Mon Sep 23 09:19:56 2019  by zhangxt
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_PMTCalibSvc_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PMTCalibSvc_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PMTCalibSvc

PMTCalibSvc_tag = $(tag)

#cmt_local_tagfile_PMTCalibSvc = $(PMTCalibSvc_tag)_PMTCalibSvc.make
cmt_local_tagfile_PMTCalibSvc = $(bin)$(PMTCalibSvc_tag)_PMTCalibSvc.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PMTCalibSvc_tag = $(tag)

#cmt_local_tagfile_PMTCalibSvc = $(PMTCalibSvc_tag).make
cmt_local_tagfile_PMTCalibSvc = $(bin)$(PMTCalibSvc_tag).make

endif

include $(cmt_local_tagfile_PMTCalibSvc)
#-include $(cmt_local_tagfile_PMTCalibSvc)

ifdef cmt_PMTCalibSvc_has_target_tag

cmt_final_setup_PMTCalibSvc = $(bin)setup_PMTCalibSvc.make
cmt_dependencies_in_PMTCalibSvc = $(bin)dependencies_PMTCalibSvc.in
#cmt_final_setup_PMTCalibSvc = $(bin)PMTCalibSvc_PMTCalibSvcsetup.make
cmt_local_PMTCalibSvc_makefile = $(bin)PMTCalibSvc.make

else

cmt_final_setup_PMTCalibSvc = $(bin)setup.make
cmt_dependencies_in_PMTCalibSvc = $(bin)dependencies.in
#cmt_final_setup_PMTCalibSvc = $(bin)PMTCalibSvcsetup.make
cmt_local_PMTCalibSvc_makefile = $(bin)PMTCalibSvc.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PMTCalibSvcsetup.make

#PMTCalibSvc :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PMTCalibSvc'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PMTCalibSvc/
#PMTCalibSvc::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

PMTCalibSvclibname   = $(bin)$(library_prefix)PMTCalibSvc$(library_suffix)
PMTCalibSvclib       = $(PMTCalibSvclibname).a
PMTCalibSvcstamp     = $(bin)PMTCalibSvc.stamp
PMTCalibSvcshstamp   = $(bin)PMTCalibSvc.shstamp

PMTCalibSvc :: dirs  PMTCalibSvcLIB
	$(echo) "PMTCalibSvc ok"

cmt_PMTCalibSvc_has_prototypes = 1

#--------------------------------------

ifdef cmt_PMTCalibSvc_has_prototypes

PMTCalibSvcprototype :  ;

endif

PMTCalibSvccompile : $(bin)PMTCalibSvc.o ;

#-- end of libary_header ----------------
#-- start of libary ----------------------

PMTCalibSvcLIB :: $(PMTCalibSvclib) $(PMTCalibSvcshstamp)
	$(echo) "PMTCalibSvc : library ok"

$(PMTCalibSvclib) :: $(bin)PMTCalibSvc.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(PMTCalibSvclib) $(bin)PMTCalibSvc.o
	$(lib_silent) $(ranlib) $(PMTCalibSvclib)
	$(lib_silent) cat /dev/null >$(PMTCalibSvcstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

#
# We add one level of dependency upon the true shared library 
# (rather than simply upon the stamp file)
# this is for cases where the shared library has not been built
# while the stamp was created (error??) 
#

$(PMTCalibSvclibname).$(shlibsuffix) :: $(PMTCalibSvclib) requirements $(use_requirements) $(PMTCalibSvcstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" PMTCalibSvc $(PMTCalibSvc_shlibflags)
	$(lib_silent) cat /dev/null >$(PMTCalibSvcshstamp)

$(PMTCalibSvcshstamp) :: $(PMTCalibSvclibname).$(shlibsuffix)
	$(lib_silent) if test -f $(PMTCalibSvclibname).$(shlibsuffix) ; then cat /dev/null >$(PMTCalibSvcshstamp) ; fi

PMTCalibSvcclean ::
	$(cleanup_echo) objects PMTCalibSvc
	$(cleanup_silent) /bin/rm -f $(bin)PMTCalibSvc.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)PMTCalibSvc.o) $(patsubst %.o,%.dep,$(bin)PMTCalibSvc.o) $(patsubst %.o,%.d.stamp,$(bin)PMTCalibSvc.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf PMTCalibSvc_deps PMTCalibSvc_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
PMTCalibSvcinstallname = $(library_prefix)PMTCalibSvc$(library_suffix).$(shlibsuffix)

PMTCalibSvc :: PMTCalibSvcinstall ;

install :: PMTCalibSvcinstall ;

PMTCalibSvcinstall :: $(install_dir)/$(PMTCalibSvcinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(PMTCalibSvcinstallname) :: $(bin)$(PMTCalibSvcinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PMTCalibSvcinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##PMTCalibSvcclean :: PMTCalibSvcuninstall

uninstall :: PMTCalibSvcuninstall ;

PMTCalibSvcuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PMTCalibSvcinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),PMTCalibSvcclean)
ifneq ($(MAKECMDGOALS),uninstall)
ifneq ($(MAKECMDGOALS),PMTCalibSvcprototype)

$(bin)PMTCalibSvc_dependencies.make : $(use_requirements) $(cmt_final_setup_PMTCalibSvc)
	$(echo) "(PMTCalibSvc.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)PMTCalibSvc.cc -end_all $(includes) $(app_PMTCalibSvc_cppflags) $(lib_PMTCalibSvc_cppflags) -name=PMTCalibSvc $? -f=$(cmt_dependencies_in_PMTCalibSvc) -without_cmt

-include $(bin)PMTCalibSvc_dependencies.make

endif
endif
endif

PMTCalibSvcclean ::
	$(cleanup_silent) \rm -rf $(bin)PMTCalibSvc_deps $(bin)PMTCalibSvc_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),PMTCalibSvcclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PMTCalibSvc.d

$(bin)$(binobj)PMTCalibSvc.d :

$(bin)$(binobj)PMTCalibSvc.o : $(cmt_final_setup_PMTCalibSvc)

$(bin)$(binobj)PMTCalibSvc.o : $(src)PMTCalibSvc.cc
	$(cpp_echo) $(src)PMTCalibSvc.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(PMTCalibSvc_pp_cppflags) $(lib_PMTCalibSvc_pp_cppflags) $(PMTCalibSvc_pp_cppflags) $(use_cppflags) $(PMTCalibSvc_cppflags) $(lib_PMTCalibSvc_cppflags) $(PMTCalibSvc_cppflags) $(PMTCalibSvc_cc_cppflags)  $(src)PMTCalibSvc.cc
endif
endif

else
$(bin)PMTCalibSvc_dependencies.make : $(PMTCalibSvc_cc_dependencies)

$(bin)PMTCalibSvc_dependencies.make : $(src)PMTCalibSvc.cc

$(bin)$(binobj)PMTCalibSvc.o : $(PMTCalibSvc_cc_dependencies)
	$(cpp_echo) $(src)PMTCalibSvc.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(PMTCalibSvc_pp_cppflags) $(lib_PMTCalibSvc_pp_cppflags) $(PMTCalibSvc_pp_cppflags) $(use_cppflags) $(PMTCalibSvc_cppflags) $(lib_PMTCalibSvc_cppflags) $(PMTCalibSvc_cppflags) $(PMTCalibSvc_cc_cppflags)  $(src)PMTCalibSvc.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: PMTCalibSvcclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PMTCalibSvc.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

PMTCalibSvcclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library PMTCalibSvc
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)PMTCalibSvc$(library_suffix).a $(library_prefix)PMTCalibSvc$(library_suffix).$(shlibsuffix) PMTCalibSvc.stamp PMTCalibSvc.shstamp
#-- end of cleanup_library ---------------
