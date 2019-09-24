#-- start of make_header -----------------

#====================================
#  Document PMTCalibSvc_python
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

cmt_PMTCalibSvc_python_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PMTCalibSvc_python_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PMTCalibSvc_python

PMTCalibSvc_tag = $(tag)

#cmt_local_tagfile_PMTCalibSvc_python = $(PMTCalibSvc_tag)_PMTCalibSvc_python.make
cmt_local_tagfile_PMTCalibSvc_python = $(bin)$(PMTCalibSvc_tag)_PMTCalibSvc_python.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PMTCalibSvc_tag = $(tag)

#cmt_local_tagfile_PMTCalibSvc_python = $(PMTCalibSvc_tag).make
cmt_local_tagfile_PMTCalibSvc_python = $(bin)$(PMTCalibSvc_tag).make

endif

include $(cmt_local_tagfile_PMTCalibSvc_python)
#-include $(cmt_local_tagfile_PMTCalibSvc_python)

ifdef cmt_PMTCalibSvc_python_has_target_tag

cmt_final_setup_PMTCalibSvc_python = $(bin)setup_PMTCalibSvc_python.make
cmt_dependencies_in_PMTCalibSvc_python = $(bin)dependencies_PMTCalibSvc_python.in
#cmt_final_setup_PMTCalibSvc_python = $(bin)PMTCalibSvc_PMTCalibSvc_pythonsetup.make
cmt_local_PMTCalibSvc_python_makefile = $(bin)PMTCalibSvc_python.make

else

cmt_final_setup_PMTCalibSvc_python = $(bin)setup.make
cmt_dependencies_in_PMTCalibSvc_python = $(bin)dependencies.in
#cmt_final_setup_PMTCalibSvc_python = $(bin)PMTCalibSvcsetup.make
cmt_local_PMTCalibSvc_python_makefile = $(bin)PMTCalibSvc_python.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PMTCalibSvcsetup.make

#PMTCalibSvc_python :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PMTCalibSvc_python'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PMTCalibSvc_python/
#PMTCalibSvc_python::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of install_python_header ------


installarea = ${CMTINSTALLAREA}
install_python_dir = $(installarea)

ifneq ($(strip "$(source)"),"")
src = ../$(source)
dest = $(install_python_dir)/python
else
src = ../python
dest = $(install_python_dir)
endif

ifneq ($(strip "$(offset)"),"")
dest = $(install_python_dir)/python
endif

PMTCalibSvc_python :: PMTCalibSvc_pythoninstall

install :: PMTCalibSvc_pythoninstall

PMTCalibSvc_pythoninstall :: $(install_python_dir)
	@if [ ! "$(installarea)" = "" ] ; then\
	  echo "installation done"; \
	fi

$(install_python_dir) ::
	@if [ "$(installarea)" = "" ] ; then \
	  echo "Cannot install header files, no installation source specified"; \
	else \
	  if [ -d $(src) ] ; then \
	    echo "Installing files from $(src) to $(dest)" ; \
	    if [ "$(offset)" = "" ] ; then \
	      $(install_command) --exclude="*.py?" $(src) $(dest) ; \
	    else \
	      $(install_command) --exclude="*.py?" $(src) $(dest) --destname $(offset); \
	    fi ; \
	  else \
	    echo "no source  $(src)"; \
	  fi; \
	fi

PMTCalibSvc_pythonclean :: PMTCalibSvc_pythonuninstall

uninstall :: PMTCalibSvc_pythonuninstall

PMTCalibSvc_pythonuninstall ::
	@if test "$(installarea)" = ""; then \
	  echo "Cannot uninstall header files, no installation source specified"; \
	else \
	  echo "Uninstalling files from $(dest)"; \
	  $(uninstall_command) "$(dest)" ; \
	fi


#-- end of install_python_header ------
#-- start of cleanup_header --------------

clean :: PMTCalibSvc_pythonclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PMTCalibSvc_python.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

PMTCalibSvc_pythonclean ::
#-- end of cleanup_header ---------------
