#-- start of make_header -----------------

#====================================
#  Library TimeCorrAlg
#
#   Generated Thu Oct 10 15:51:27 2019  by yumiao
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TimeCorrAlg_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TimeCorrAlg_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TimeCorrAlg

TimeCorrAlg_tag = $(tag)

#cmt_local_tagfile_TimeCorrAlg = $(TimeCorrAlg_tag)_TimeCorrAlg.make
cmt_local_tagfile_TimeCorrAlg = $(bin)$(TimeCorrAlg_tag)_TimeCorrAlg.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TimeCorrAlg_tag = $(tag)

#cmt_local_tagfile_TimeCorrAlg = $(TimeCorrAlg_tag).make
cmt_local_tagfile_TimeCorrAlg = $(bin)$(TimeCorrAlg_tag).make

endif

include $(cmt_local_tagfile_TimeCorrAlg)
#-include $(cmt_local_tagfile_TimeCorrAlg)

ifdef cmt_TimeCorrAlg_has_target_tag

cmt_final_setup_TimeCorrAlg = $(bin)setup_TimeCorrAlg.make
cmt_dependencies_in_TimeCorrAlg = $(bin)dependencies_TimeCorrAlg.in
#cmt_final_setup_TimeCorrAlg = $(bin)TimeCorrAlg_TimeCorrAlgsetup.make
cmt_local_TimeCorrAlg_makefile = $(bin)TimeCorrAlg.make

else

cmt_final_setup_TimeCorrAlg = $(bin)setup.make
cmt_dependencies_in_TimeCorrAlg = $(bin)dependencies.in
#cmt_final_setup_TimeCorrAlg = $(bin)TimeCorrAlgsetup.make
cmt_local_TimeCorrAlg_makefile = $(bin)TimeCorrAlg.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TimeCorrAlgsetup.make

#TimeCorrAlg :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TimeCorrAlg'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TimeCorrAlg/
#TimeCorrAlg::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

TimeCorrAlglibname   = $(bin)$(library_prefix)TimeCorrAlg$(library_suffix)
TimeCorrAlglib       = $(TimeCorrAlglibname).a
TimeCorrAlgstamp     = $(bin)TimeCorrAlg.stamp
TimeCorrAlgshstamp   = $(bin)TimeCorrAlg.shstamp

TimeCorrAlg :: dirs  TimeCorrAlgLIB
	$(echo) "TimeCorrAlg ok"

cmt_TimeCorrAlg_has_prototypes = 1

#--------------------------------------

ifdef cmt_TimeCorrAlg_has_prototypes

TimeCorrAlgprototype :  ;

endif

TimeCorrAlgcompile : $(bin)TimeCorrAlg.o ;

#-- end of libary_header ----------------
#-- start of libary ----------------------

TimeCorrAlgLIB :: $(TimeCorrAlglib) $(TimeCorrAlgshstamp)
	$(echo) "TimeCorrAlg : library ok"

$(TimeCorrAlglib) :: $(bin)TimeCorrAlg.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(TimeCorrAlglib) $(bin)TimeCorrAlg.o
	$(lib_silent) $(ranlib) $(TimeCorrAlglib)
	$(lib_silent) cat /dev/null >$(TimeCorrAlgstamp)

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

$(TimeCorrAlglibname).$(shlibsuffix) :: $(TimeCorrAlglib) requirements $(use_requirements) $(TimeCorrAlgstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin="$(bin)" ld="$(shlibbuilder)" ldflags="$(shlibflags)" suffix=$(shlibsuffix) libprefix=$(library_prefix) libsuffix=$(library_suffix) $(make_shlib) "$(tags)" TimeCorrAlg $(TimeCorrAlg_shlibflags)
	$(lib_silent) cat /dev/null >$(TimeCorrAlgshstamp)

$(TimeCorrAlgshstamp) :: $(TimeCorrAlglibname).$(shlibsuffix)
	$(lib_silent) if test -f $(TimeCorrAlglibname).$(shlibsuffix) ; then cat /dev/null >$(TimeCorrAlgshstamp) ; fi

TimeCorrAlgclean ::
	$(cleanup_echo) objects TimeCorrAlg
	$(cleanup_silent) /bin/rm -f $(bin)TimeCorrAlg.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)TimeCorrAlg.o) $(patsubst %.o,%.dep,$(bin)TimeCorrAlg.o) $(patsubst %.o,%.d.stamp,$(bin)TimeCorrAlg.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf TimeCorrAlg_deps TimeCorrAlg_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
TimeCorrAlginstallname = $(library_prefix)TimeCorrAlg$(library_suffix).$(shlibsuffix)

TimeCorrAlg :: TimeCorrAlginstall ;

install :: TimeCorrAlginstall ;

TimeCorrAlginstall :: $(install_dir)/$(TimeCorrAlginstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(TimeCorrAlginstallname) :: $(bin)$(TimeCorrAlginstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(TimeCorrAlginstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##TimeCorrAlgclean :: TimeCorrAlguninstall

uninstall :: TimeCorrAlguninstall ;

TimeCorrAlguninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(TimeCorrAlginstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),TimeCorrAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
ifneq ($(MAKECMDGOALS),TimeCorrAlgprototype)

$(bin)TimeCorrAlg_dependencies.make : $(use_requirements) $(cmt_final_setup_TimeCorrAlg)
	$(echo) "(TimeCorrAlg.make) Rebuilding $@"; \
	  $(build_dependencies) -out=$@ -start_all $(src)TimeCorrAlg.cc -end_all $(includes) $(app_TimeCorrAlg_cppflags) $(lib_TimeCorrAlg_cppflags) -name=TimeCorrAlg $? -f=$(cmt_dependencies_in_TimeCorrAlg) -without_cmt

-include $(bin)TimeCorrAlg_dependencies.make

endif
endif
endif

TimeCorrAlgclean ::
	$(cleanup_silent) \rm -rf $(bin)TimeCorrAlg_deps $(bin)TimeCorrAlg_dependencies.make
#-- end of dependencies -------------------
#-- start of cpp_library -----------------

ifneq (,)

ifneq ($(MAKECMDGOALS),TimeCorrAlgclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TimeCorrAlg.d

$(bin)$(binobj)TimeCorrAlg.d :

$(bin)$(binobj)TimeCorrAlg.o : $(cmt_final_setup_TimeCorrAlg)

$(bin)$(binobj)TimeCorrAlg.o : $(src)TimeCorrAlg.cc
	$(cpp_echo) $(src)TimeCorrAlg.cc
	$(cpp_silent) $(cppcomp)  -o $@ $(use_pp_cppflags) $(TimeCorrAlg_pp_cppflags) $(lib_TimeCorrAlg_pp_cppflags) $(TimeCorrAlg_pp_cppflags) $(use_cppflags) $(TimeCorrAlg_cppflags) $(lib_TimeCorrAlg_cppflags) $(TimeCorrAlg_cppflags) $(TimeCorrAlg_cc_cppflags)  $(src)TimeCorrAlg.cc
endif
endif

else
$(bin)TimeCorrAlg_dependencies.make : $(TimeCorrAlg_cc_dependencies)

$(bin)TimeCorrAlg_dependencies.make : $(src)TimeCorrAlg.cc

$(bin)$(binobj)TimeCorrAlg.o : $(TimeCorrAlg_cc_dependencies)
	$(cpp_echo) $(src)TimeCorrAlg.cc
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TimeCorrAlg_pp_cppflags) $(lib_TimeCorrAlg_pp_cppflags) $(TimeCorrAlg_pp_cppflags) $(use_cppflags) $(TimeCorrAlg_cppflags) $(lib_TimeCorrAlg_cppflags) $(TimeCorrAlg_cppflags) $(TimeCorrAlg_cc_cppflags)  $(src)TimeCorrAlg.cc

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: TimeCorrAlgclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TimeCorrAlg.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TimeCorrAlgclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library TimeCorrAlg
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)TimeCorrAlg$(library_suffix).a $(library_prefix)TimeCorrAlg$(library_suffix).$(shlibsuffix) TimeCorrAlg.stamp TimeCorrAlg.shstamp
#-- end of cleanup_library ---------------
