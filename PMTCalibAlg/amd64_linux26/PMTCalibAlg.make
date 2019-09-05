#-- start of make_header -----------------

#====================================
#  Library PMTCalibAlg
#
#   Generated Thu Sep  5 19:12:10 2019  by yumiao
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_PMTCalibAlg_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PMTCalibAlg_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PMTCalibAlg

PMTCalibAlg_tag = $(tag)

#cmt_local_tagfile_PMTCalibAlg = $(PMTCalibAlg_tag)_PMTCalibAlg.make
cmt_local_tagfile_PMTCalibAlg = $(bin)$(PMTCalibAlg_tag)_PMTCalibAlg.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PMTCalibAlg_tag = $(tag)

#cmt_local_tagfile_PMTCalibAlg = $(PMTCalibAlg_tag).make
cmt_local_tagfile_PMTCalibAlg = $(bin)$(PMTCalibAlg_tag).make

endif

include $(cmt_local_tagfile_PMTCalibAlg)
#-include $(cmt_local_tagfile_PMTCalibAlg)

ifdef cmt_PMTCalibAlg_has_target_tag

cmt_final_setup_PMTCalibAlg = $(bin)setup_PMTCalibAlg.make
cmt_dependencies_in_PMTCalibAlg = $(bin)dependencies_PMTCalibAlg.in
#cmt_final_setup_PMTCalibAlg = $(bin)PMTCalibAlg_PMTCalibAlgsetup.make
cmt_local_PMTCalibAlg_makefile = $(bin)PMTCalibAlg.make

else

cmt_final_setup_PMTCalibAlg = $(bin)setup.make
cmt_dependencies_in_PMTCalibAlg = $(bin)dependencies.in
#cmt_final_setup_PMTCalibAlg = $(bin)PMTCalibAlgsetup.make
cmt_local_PMTCalibAlg_makefile = $(bin)PMTCalibAlg.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PMTCalibAlgsetup.make

#PMTCalibAlg :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PMTCalibAlg'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PMTCalibAlg/
#PMTCalibAlg::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

PMTCalibAlglibname   = $(bin)$(library_prefix)PMTCalibAlg$(library_suffix)
PMTCalibAlglib       = $(PMTCalibAlglibname).a
PMTCalibAlgstamp     = $(bin)PMTCalibAlg.stamp
PMTCalibAlgshstamp   = $(bin)PMTCalibAlg.shstamp

PMTCalibAlg :: dirs  PMTCalibAlgLIB
	$(echo) "PMTCalibAlg ok"

cmt_PMTCalibAlg_has_prototypes = 1

#--------------------------------------

ifdef cmt_PMTCalibAlg_has_prototypes

PMTCalibAlgprototype :  ;

endif

PMTCalibAlgcompile : $(bin)PMTCalibAlg.o ;

#-- end of libary_header ----------------
#-- start of libary ----------------------

PMTCalibAlgLIB :: $(PMTCalibAlglib) $(PMTCalibAlgshstamp)
	$(echo) "PMTCalibAlg : library ok"

$(PMTCalibAlglib) :: $(bin)PMTCalibAlg.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(PMTCalibAlglib) $(bin)PMTCalibAlg.o
	$(lib_silent) $(ranlib) $(PMTCalibAlglib)
	$(lib_silent) cat /dev/null >$(PMTCalibAlgstamp)

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

$(PMTCalibAlglibname).$(shlibsuffix) :: $(PMTCalibAlglib) requirements $(use_requirements) $(PMTCalibAlgstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" PMTCalibAlg $(PMTCalibAlg_shlibflags)
	$(lib_silent) cat /dev/null >$(PMTCalibAlgshstamp)

$(PMTCalibAlgshstamp) :: $(PMTCalibAlglibname).$(shlibsuffix)
	$(lib_silent) if test -f $(PMTCalibAlglibname).$(shlibsuffix) ; then cat /dev/null >$(PMTCalibAlgshstamp) ; fi

PMTCalibAlgclean ::
	$(cleanup_echo) objects PMTCalibAlg
	$(cleanup_silent) /bin/rm -f $(bin)PMTCalibAlg.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)PMTCalibAlg.o) $(patsubst %.o,%.dep,$(bin)PMTCalibAlg.o) $(patsubst %.o,%.d.stamp,$(bin)PMTCalibAlg.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf PMTCalibAlg_deps PMTCalibAlg_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
PMTCalibAlginstallname = $(library_prefix)PMTCalibAlg$(library_suffix).$(shlibsuffix)

PMTCalibAlg :: PMTCalibAlginstall ;

install :: PMTCalibAlginstall ;

PMTCalibAlginstall :: $(install_dir)/$(PMTCalibAlginstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(PMTCalibAlginstallname) :: $(bin)$(PMTCalibAlginstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PMTCalibAlginstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##PMTCalibAlgclean :: PMTCalibAlguninstall

uninstall :: PMTCalibAlguninstall ;

PMTCalibAlguninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PMTCalibAlginstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),PMTCalibAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
ifneq ($(MAKECMDGOALS),PMTCalibAlgprototype)

$(bin)PMTCalibAlg_dependencies.make : $(use_requirements) $(cmt_final_setup_PMTCalibAlg)
	$(echo) "(PMTCalibAlg.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)PMTCalibAlg.cc -end_all $(includes) $(app_PMTCalibAlg_cppflags) $(lib_PMTCalibAlg_cppflags) -name=PMTCalibAlg $? -f=$(cmt_dependencies_in_PMTCalibAlg) -without_cmt

-include $(bin)PMTCalibAlg_dependencies.make

endif
endif
endif

PMTCalibAlgclean ::
	$(cleanup_silent) \rm -rf $(bin)PMTCalibAlg_deps $(bin)PMTCalibAlg_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),PMTCalibAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PMTCalibAlg.d

$(bin)$(binobj)PMTCalibAlg.d :

$(bin)$(binobj)PMTCalibAlg.o : $(cmt_final_setup_PMTCalibAlg)

$(bin)$(binobj)PMTCalibAlg.o : $(src)PMTCalibAlg.cc
	$(cpp_echo) $(src)PMTCalibAlg.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(PMTCalibAlg_pp_cppflags) $(lib_PMTCalibAlg_pp_cppflags) $(PMTCalibAlg_pp_cppflags) $(use_cppflags) $(PMTCalibAlg_cppflags) $(lib_PMTCalibAlg_cppflags) $(PMTCalibAlg_cppflags) $(PMTCalibAlg_cc_cppflags)  $(src)PMTCalibAlg.cc
endif
endif

else
$(bin)PMTCalibAlg_dependencies.make : $(PMTCalibAlg_cc_dependencies)

$(bin)PMTCalibAlg_dependencies.make : $(src)PMTCalibAlg.cc

$(bin)$(binobj)PMTCalibAlg.o : $(PMTCalibAlg_cc_dependencies)
	$(cpp_echo) $(src)PMTCalibAlg.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(PMTCalibAlg_pp_cppflags) $(lib_PMTCalibAlg_pp_cppflags) $(PMTCalibAlg_pp_cppflags) $(use_cppflags) $(PMTCalibAlg_cppflags) $(lib_PMTCalibAlg_cppflags) $(PMTCalibAlg_cppflags) $(PMTCalibAlg_cc_cppflags)  $(src)PMTCalibAlg.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: PMTCalibAlgclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PMTCalibAlg.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

PMTCalibAlgclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library PMTCalibAlg
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)PMTCalibAlg$(library_suffix).a $(library_prefix)PMTCalibAlg$(library_suffix).$(shlibsuffix) PMTCalibAlg.stamp PMTCalibAlg.shstamp
#-- end of cleanup_library ---------------
