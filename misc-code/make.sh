#!/usr/bin/env bash
#script to build mlton
help(){
    echo -e "usage: make.sh [options] [target]\nOptions:"
    echo -e "\t -h|--help print this help and exit"
    echo -e "\t -v|--version print version information"
    echo -e "\t --prefix DIR: instalation prefix"
    echo -e "\t --mlton FILE: Location of mlton executable"
    echo -e "\t --smlnj FILE: Location of smlnj executable"
    echo -e "\t --polyml FILE: Location of polyml executable"
    echo -e "\t --arch ARCH: compile for target arch ARCH"
    echo -e "\t --os OS: compile for target os OS"
    echo -e "\t -b|--build DIR: build directory [pwd/build]"
    echo -e "\t -s|--source DIR: where to find the sources [pwd]"
    echo -e "\t -j|--jobs NUM: run NUM jobs at once while building"
    echo -e "\t -t|--target TARGET: target if x-compiling [self]"
    echo -e "\t -c|--current: compile mlton once, using mlton from build/bin
\tby default, or using argument from --mlton if that is passed
\t\tIf this is not passed mlton is compiled twice, once using mlton
\t\tfrom path/--mlton and then recompiled using mlton from build dir"
    echo -e "Environment variables:"
    echo -e "Targets:\n\tAll:full build of mlton with docs"
    echo -e "\tAll-no-docs:full build of mlton w/o documentation"
    echo -e "\tBootstrap-smlnj:bootstrap mlton using smlnj"

    exit 0
}
source platform
TEMP=$(getopt -o h,v,b:,a:,q:,c\
-l prefix:,os:,arch:,mlton:,smlnj:,polyml,help,version,default,build:,compile \
-n 'mlton.sh' -- "$@")
if [ $? != 0 ] ; then echo "Getopt failed, error $?" >&2 ; exit 1 ; fi

eval set -- "$TEMP"
JOBS=1
#parse args
while true;do
    case "$1" in
        -h|--help) help;;
        -v|--version) echo "mlton.sh version $VERSION"; exit 0;;
        --prefix) prefix="$2";shift 2;;
        -o|--os) TARGET_OS="$2";shift 2;;
        -a|--arch) TARGET_ARCH="$2";shift 2;;
        -t|--target) TARGET="$2";shift 2;;
        -b|--build) BUILD="$2";shift 2;;
        -s|--source) SRC="$2";shift 2;;
        -c|--current) RECOMPILE=0;shift;;
        -j|--jobs) JOBS="$2";shift 2;;
        --mlton) run_mlton="$2";mlton_set=1;shift 2;;
        --smlnj) run_smlnj="$2";shift 2;;
        --polyml) run_polyml="$2";shift 2;;
        --) shift ; break;;
        *) echo "Internal error!, remaining args: $@"; exit 1 ;;
    esac
done
if [ "$#" != 0 ]; then RULE="$1"
else RULE=all
fi
[[ -z "$TARGET" ]] && TARGET=self
[[ -z "$TARGET_OS" ]] && TARGET_OS=get_os
[[ -z "$TARGET_ARCH" ]] && TARGET_ARCH=get_arch
#check where build dir is, if we're using a current mlton to build
#then set mlton to build/bin/mlton, unless mlton executable explictly given
[[ -z "$BUILD" ]] && BUILD="$PWD/build"
#test for build dir?
if [ -z "$RECOMPILE" ]; then RECOMPILE=1
elif [ -z "$run_mlton" ]; then run_mlton=$BUILD/bin/mlton
fi
[[ -z "$run_mlton" ]] && run_mlton=type -p mlton
[[ -z "$run_smlnj" ]] && run_smlnj=type -p sml
[[ -z "$run_polyml" ]] && run_polyml=type -p poly
[[ -z "$SRC" ]] && SRC="$PWD"
# export TARGET := self
export TARGET_OS
export TARGET_ARCH
# ROOT := $(shell pwd)
BIN=${BUILD}/bin
LIB=${BUILD}/lib
INC=${LIB}/include
#set directory of actual mlton source
COMP=${SRC}/mlton
RUN=${SRC}/runtime
MLTON_NEW=${BIN}/mlton
# AOUT := mlton-compile
# ifeq (mingw, $(TARGET_OS))
# EXE := .exe
# else
# EXE :=
# endif
# MLBPATHMAP := $(LIB)/mlb-path-map
# SPEC := package/rpm/mlton.spec
# LEX := mllex
# PROF := mlprof
# YACC := mlyacc
# NLFFIGEN := mlnlffigen
# PATH := $(BIN):$(SRC)/bin:$(shell echo $$PATH)
alias cp='/bin/cp -fpR'
alias gzip='gzip --force --best'
# RANLIB := ranlib

# # If we're compiling with another version of MLton, then we want to do
# # another round of compilation so that we get a MLton built without
# # stubs.
# ifeq (other, $(shell if [ ! -x "$(BIN)/mlton" ]; then echo other; fi))
# 	BOOTSTRAP_OTHER:=true
# else
# 	BOOTSTRAP_OTHER:=false
# endif

[[ -z "$VERSION" ]] && VERSION=$(date +%Y%m%d)
[[ -z "$RELEASE" && RELEASE=1

all(){
    all-no-docs
    docs 
}

dirs(){

    mkdir -p "$(BIN)" "$(INC)"
    mkdir -p "$(LIB)/targets/$(TARGET)/include"
    mkdir -p "$(LIB)/targets/$(TARGET)/sml"
}
all-non-docs(){
# 	$(MAKE) dirs runtime compiler basis-no-check script mlbpathmap constants libraries tools
# # Remove $(AOUT) so that the $(MAKE) compiler below will remake MLton.
# # We also want to re-run the just-built tools (mllex and mlyacc)
# # because they may be better than those that were used for the first
# # round of compilation.  So, we clean out the front end.
# ifeq (true, $(BOOTSTRAP_OTHER))
# 	rm -f "$(COMP)/$(AOUT)$(EXE)"
# 	$(MAKE) -C "$(COMP)/front-end" clean
# endif
# 	$(MAKE) compiler basis
# 	@echo 'Build of MLton succeeded.'
}
basis-no-check(){
# basis-no-check:
# 	mkdir -p "$(LIB)/sml"
# 	rm -rf "$(LIB)/sml/basis"
# 	$(CP) "$(SRC)/basis-library/." "$(LIB)/sml/basis"
# 	find "$(LIB)/sml/basis" -type d -name .svn | xargs rm -rf
# 	find "$(LIB)/sml/basis" -type f -name .ignore | xargs rm -rf
}
basis(){
# basis:
# 	$(MAKE) basis-no-check
# 	@echo 'Type checking basis.'
# 	"$(MLTON)" -disable-ann deadCode \
# 		-stop tc \
# 		'$$(SML_LIB)/basis/libs/all.mlb' \
# 		>/dev/null
}
bootstrap-nj(){
# bootstrap-nj:
# 	$(MAKE) nj-mlton
# 	$(MAKE) all
}
clean(){
# clean:
# 	bin/clean
}
clean-svn(){
# clean-svn:
# 	find . -type d | grep .svn | xargs rm -rf
}
compiler(){
# compiler:
# 	$(MAKE) -C "$(COMP)"
# 	$(CP) "$(COMP)/$(AOUT)$(EXE)" "$(LIB)/"
}
constants(){
# constants:
# 	@echo 'Creating constants file.'
# 	"$(BIN)/mlton" -target "$(TARGET)" -build-constants true >tmp.c
# 	"$(BIN)/mlton" -target "$(TARGET)" -output tmp tmp.c
# 	./tmp >"$(LIB)/targets/$(TARGET)/constants"
# 	rm -f tmp tmp.exe tmp.c
}
debugged(){
# debugged:
# 	$(MAKE) -C "$(COMP)" "AOUT=$(AOUT).debug" COMPILE_ARGS="-debug true -const 'Exn.keepHistory true' -profile-val true -const 'MLton.debug true' -drop-pass 'deepFlatten'"
# 	$(CP) "$(COMP)/$(AOUT).debug" "$(LIB)/"
# 	sed 's/mlton-compile/mlton-compile.debug/' < "$(MLTON)" > "$(MLTON).debug"
# 	chmod a+x "$(MLTON).debug"
}

docs(){
# docs: dirs
# 	$(MAKE) -C "$(LEX)" docs
# 	$(MAKE) -C "$(YACC)" docs
# 	if htmldoc --version >/dev/null 2>&1; then \
# 		bin/make-pdf-guide; \
# 	fi
}
LIBRARIES="ckit-lib cml mllpt-lib mlnlffi-lib mlrisc-lib mlyacc-lib smlnj-lib"

libraries-no-check(){
# libraries-no-check:
# 	mkdir -p "$(LIB)/sml"
# 	cd "$(LIB)/sml" && rm -rf $(LIBRARIES)
# 	$(MAKE) -C "$(SRC)/lib/ckit-lib"
# 	$(MAKE) -C "$(SRC)/lib/mllpt-lib"
# 	$(MAKE) -C "$(SRC)/lib/mlnlffi-lib"
# 	$(MAKE) -C "$(SRC)/lib/mlrisc-lib"
# 	$(MAKE) -C "$(SRC)/lib/smlnj-lib"
# 	$(CP) "$(SRC)/lib/cml/." "$(LIB)/sml/cml"
# 	$(CP) "$(SRC)/lib/ckit-lib/ckit/." "$(LIB)/sml/ckit-lib"
# 	$(CP) "$(SRC)/lib/mlnlffi-lib/." "$(LIB)/sml/mlnlffi-lib"
# 	$(CP) "$(SRC)/lib/mlrisc-lib/MLRISC/." "$(LIB)/sml/mlrisc-lib"
# 	$(CP) "$(SRC)/lib/mllpt-lib/ml-lpt/lib/." "$(LIB)/sml/mllpt-lib"
# 	$(CP) "$(SRC)/lib/mlyacc-lib/." "$(LIB)/sml/mlyacc-lib"
# 	$(CP) "$(SRC)/lib/smlnj-lib/smlnj-lib/." "$(LIB)/sml/smlnj-lib"
# 	find "$(LIB)/sml" -type d -name .cm | xargs rm -rf
# 	find "$(LIB)/sml" -type d -name .svn | xargs rm -rf
# 	find "$(LIB)/sml" -type f -name .ignore | xargs rm -rf
}
libraries(){
# libraries:
# 	$(MAKE) libraries-no-check
# 	for f in $(LIBRARIES); do				\
# 		echo "Type checking $$f library.";		\
# 		"$(MLTON)" -disable-ann deadCode		\
# 			-stop tc				\
# 			'$$(SML_LIB)/'"$$f/$$f.mlb"		\
# 			>/dev/null;				\
# 	done
}
mlbpathmap(){
# mlbpathmap:
# 	touch "$(MLBPATHMAP)"
# 	( echo 'MLTON_ROOT $$(LIB_MLTON_DIR)/sml';	\
# 	  echo 'SML_LIB $$(LIB_MLTON_DIR)/sml'; )	\
# 		>>"$(MLBPATHMAP).tmp"
# 	mv "$(MLBPATHMAP).tmp" "$(MLBPATHMAP)"
}
polyml-mlton(){
# polyml-mlton:
# 	$(MAKE) dirs runtime
# 	$(MAKE) -C "$(COMP)" polyml-mlton
# 	$(CP) "$(COMP)/mlton-polyml$(EXE)" "$(LIB)/"
# 	$(MAKE) script basis-no-check mlbpathmap constants libraries-no-check
# 	@echo 'Build of MLton succeeded.'
}
profiled(){
# profiled:
# 	for t in alloc count time; do					\
# 		$(MAKE) -C "$(COMP)" "AOUT=$(AOUT).$$t"			\
# 			COMPILE_ARGS="-profile $$t";			\
# 		$(CP) "$(COMP)/$(AOUT).$$t" "$(LIB)/";			\
# 		sed "s/mlton-compile/mlton-compile.$$t/" 		\
# 			<"$(MLTON)" 					\
# 			>"$(MLTON).$$t";				\
# 		chmod a+x "$(MLTON).$$t";				\
# 	done
}
runtime(){
# runtime:
echo 'Compiling MLton runtime system for ${TARGET}.'
(cd $RUN && make)
cp "$SRC"/include/*.h "$INC/"
cp "$RUN"/*.a "$RUN"/gen/sizes -t "${LIB}/targets/${TARGET}/"
cp "$RUN"/gen/c-types.sml "${LIB}/targets/${TARGET}/sml/"
echo "$TARGET_OS" > "${LIB}/targets/${TARGET}/os"
# 	echo "$(TARGET_ARCH)" > "$(LIB)/targets/$(TARGET)/arch"
# 	$(CP) runtime/gen/basis-ffi.sml \
# 		basis-library/primitive/basis-ffi.sml
# 	$(CP) runtime/*.h "$(INC)/"
# 	mv "$(INC)/c-types.h" "$(LIB)/targets/$(TARGET)/include"
# 	for d in basis basis/Real basis/Word gc platform util; do	\
# 		mkdir -p "$(INC)/$$d";					\
# 		$(CP) runtime/$$d/*.h "$(INC)/$$d";			\
# 	done
# 	for x in "$(LIB)/targets/$(TARGET)"/*.a; do $(RANLIB) "$$x"; done
}
script(){
# script:
# 	$(CP) bin/mlton-script "$(MLTON)"
# 	chmod a+x "$(MLTON)"
# 	$(CP) "$(SRC)/bin/platform" "$(LIB)"
# 	$(CP) "$(SRC)/bin/static-library" "$(LIB)"
# ifeq (mingw, $(TARGET_OS))
# 	$(CP) "$(SRC)/bin/static-library.bat" "$(LIB)"
# endif
}
smlnj-mlton(){
# smlnj-mlton:
# 	$(MAKE) dirs runtime
# 	$(MAKE) -C "$(COMP)" smlnj-mlton
# 	smlnj_heap_suffix=`echo 'TextIO.output (TextIO.stdErr, SMLofNJ.SysInfo.getHeapSuffix ());' | sml 2>&1 1> /dev/null` && $(CP) "$(COMP)/mlton-smlnj.$$smlnj_heap_suffix" "$(LIB)/"
# 	$(MAKE) script basis-no-check mlbpathmap constants libraries-no-check
# 	@echo 'Build of MLton succeeded.'
}
# .PHONY: smlnj-mlton-dual
# smlnj-mlton-dual:
# 	$(MAKE) SMLNJ_CM_SERVERS_NUM=2 smlnj-mlton

# .PHONY: smlnj-mlton-quad
# smlnj-mlton-quad:
# 	$(MAKE) SMLNJ_CM_SERVERS_NUM=4 smlnj-mlton

traced(){
# traced:
# 	$(MAKE) -C "$(COMP)" "AOUT=$(AOUT).trace" COMPILE_ARGS="-const 'Exn.keepHistory true' -profile-val true -const 'MLton.debug true' -drop-pass 'deepFlatten'"
# 	$(CP) "$(COMP)/$(AOUT).trace" "$(LIB)/"
# 	sed 's/mlton-compile/mlton-compile.trace/' < "$(MLTON)" > "$(MLTON).trace"
# 	chmod a+x "$(MLTON).trace"
}
tools(){
# tools:
# 	$(MAKE) -C "$(LEX)"
# 	$(MAKE) -C "$(NLFFIGEN)"
# 	$(MAKE) -C "$(PROF)"
# 	$(MAKE) -C "$(YACC)"
# 	$(CP) "$(LEX)/$(LEX)$(EXE)"		\
# 		"$(NLFFIGEN)/$(NLFFIGEN)$(EXE)"	\
# 		"$(PROF)/$(PROF)$(EXE)"		\
# 		"$(YACC)/$(YACC)$(EXE)"		\
# 		"$(BIN)/"
}
version(){
# version:
# 	@echo 'Instantiating version numbers.'
# 	for f in							\
# 		"$(SPEC)"						\
# 		package/freebsd/Makefile				\
# 		mlton/control/version_sml.src;				\
# 	do								\
# 		sed "s/\(.*\)MLTONVERSION\(.*\)/\1$(VERSION)\2/" <"$$f" >z && \
# 		mv z "$$f";						\
# 	done
# 	sed <"$(SPEC)" >z "/^Release:/s;.*;Release: $(RELEASE);"
# 	mv z "$(SPEC)"
}
check(){
# check:
# 	./bin/regression
}

#Below are mostly just install files

# # The TBIN and TLIB are where the files are going to be after installing.
# # The DESTDIR and is added onto them to indicate where the Makefile actually
# # puts them.
# DESTDIR := $(CURDIR)/install
# PREFIX := /usr
# ifeq ($(findstring $(TARGET_OS), darwin freebsd solaris), $(TARGET_OS))
# PREFIX := /usr/local
# endif
# ifeq ($(TARGET_OS), mingw)
# PREFIX := /mingw
# endif
# prefix := $(PREFIX)
# MAN_PREFIX_EXTRA :=
# TBIN := $(DESTDIR)$(prefix)/bin
# ULIB := lib/mlton
# TLIB := $(DESTDIR)$(prefix)/$(ULIB)
# TMAN := $(DESTDIR)$(prefix)$(MAN_PREFIX_EXTRA)/man/man1
# TDOC := $(DESTDIR)$(prefix)/share/doc/mlton
# ifeq ($(findstring $(TARGET_OS), solaris mingw), $(TARGET_OS))
# TDOC := $(DESTDIR)$(prefix)/doc/mlton
# endif
# TEXM := $(TDOC)/examples

# GZIP_MAN := true
# ifeq ($(TARGET_OS), solaris)
# GZIP_MAN := false
# endif

# .PHONY: install
# install: install-no-strip install-strip

# .PHONY: install-no-strip
# install-no-strip: install-docs install-no-docs move-docs 

# MAN_PAGES :=  \
# 	mllex.1 \
# 	mlnlffigen.1 \
# 	mlprof.1 \
# 	mlton.1 \
# 	mlyacc.1

# .PHONY: install-no-docs
# install-no-docs:
# 	mkdir -p "$(TLIB)" "$(TBIN)" "$(TMAN)"
# 	$(CP) "$(LIB)/." "$(TLIB)/"
# 	sed "/^lib=/s;.*;lib='$(prefix)/$(ULIB)';"			\
# 		<"$(BIN)/mlton" >"$(TBIN)/mlton"
# 	chmod a+x "$(TBIN)/mlton"
# 	if [ -x "$(BIN)/mlton.trace" ]; then                            \
# 		sed "/^lib=/s;.*;lib='$(prefix)/$(ULIB)';"		\
# 			<"$(BIN)/mlton.trace" >"$(TBIN)/mlton.trace";   \
# 		chmod a+x "$(TBIN)/mlton.trace";                        \
# 	fi
# 	if [ -x "$(BIN)/mlton.debug" ]; then                            \
# 		sed "/^lib=/s;.*;lib='$(prefix)/$(ULIB)';"		\
# 			<"$(BIN)/mlton.debug" >"$(TBIN)/mlton.debug";   \
# 		chmod a+x "$(TBIN)/mlton.debug";                        \
# 	fi
# 	cd "$(BIN)" && $(CP) "$(LEX)$(EXE)" "$(NLFFIGEN)$(EXE)"		\
# 		 "$(PROF)$(EXE)" "$(YACC)$(EXE)" "$(TBIN)/"
# 	( cd "$(SRC)/man" && tar cf - $(MAN_PAGES)) | \
# 		( cd "$(TMAN)/" && tar xf - )
# 	if $(GZIP_MAN); then						\
# 		cd "$(TMAN)" && $(GZIP) $(MAN_PAGES);			\
# 	fi

# .PHONY: install-strip
# install-strip:
# 	case "$(TARGET_OS)" in						\
# 	aix|cygwin|darwin|solaris)					\
# 	;;								\
# 	*)								\
# 		for f in "$(TLIB)/$(AOUT)$(EXE)" "$(TBIN)/$(LEX)$(EXE)"	\
# 			"$(TBIN)/$(NLFFIGEN)$(EXE)" "$(TBIN)/$(PROF)$(EXE)" \
# 			"$(TBIN)/$(YACC)$(EXE)"; do			\
# 			strip --remove-section=.comment			\
# 				--remove-section=.note "$$f";		\
# 		done							\
# 	esac

# .PHONY: install-docs
# install-docs:
# 	mkdir -p "$(TDOC)"
# 	(								\
# 		cd "$(SRC)/doc" &&					\
# 		$(CP) changelog examples guide license README "$(TDOC)/" \
# 	)
# 	if [ -r "$(TDOC)/guide/mlton-guide.pdf" ]; then			\
# 		cp "$(TDOC)/guide/mlton-guide.pdf" "$(TDOC)/";		\
# 	fi
# 	(								\
# 		cd "$(SRC)/util" &&					\
# 		$(CP) cmcat cm2mlb "$(TDOC)/"				\
# 	)
# 	for f in callcc command-line hello-world same-fringe signals	\
# 			size taut thread1 thread2 thread-switch timeout \
# 		; do							\
# 		$(CP) "$(SRC)/regression/$$f.sml" "$(TEXM)/";		\
# 	done
# 	if test -r $(LEX)/$(LEX).pdf; then                              \
# 		$(CP) $(LEX)/$(LEX).pdf $(TDOC);                        \
# 	fi
# 	if test -r $(YACC)/$(YACC).pdf; then                            \
# 		$(CP) $(YACC)/$(YACC).pdf $(TDOC);                      \
# 	fi
# 	find "$(TDOC)/" -name .svn -type d | xargs rm -rf
# 	find "$(TDOC)/" -name .ignore -type f | xargs rm -rf
# 	find "$(TEXM)/" -name .svn -type d | xargs rm -rf
# 	find "$(TEXM)/" -name .ignore -type f | xargs rm -rf


# .PHONY: move-docs
# move-docs:	install-docs install-no-docs
# 	cd "$(TLIB)/sml"; for i in *; do test -d "$(TDOC)/$$i" || mkdir -p "$(TDOC)/$$i"; done
# 	cd "$(TLIB)/sml"; for i in */[Dd]oc; do mv "$$i" "$(TDOC)/$$i"; done
# 	cd "$(TLIB)/sml"; for i in */README*; do mv "$$i" "$(TDOC)/$$i"; done

# .PHONY: release
# release: version
# 	tar cvzf ../mlton-$(VERSION).tar.gz \
# 		--exclude .svn --exclude package \
# 		--transform "s@^@mlton-$(VERSION)/@" \
# 		*

# BSDSRC := /tmp/mlton-$(VERSION)
# .PHONY: freebsd
# freebsd:
# 	$(MAKE) clean clean-svn version
# 	rm -rf "$(BSDSRC)"
# 	mkdir -p "$(BSDSRC)"
# 	( cd $(SRC) && tar -cpf - . ) | ( cd "$(BSDSRC)" && tar -xpf - )
# 	cd /tmp && tar -cpf - mlton-$(VERSION) | \
# 		 $(GZIP) >/usr/ports/distfiles/mlton-$(VERSION)-$(RELEASE).freebsd.src.tgz
#         # do not change "make" to "$(MAKE)" in the following line
# 	cd "$(BSDSRC)/package/freebsd" && MAINTAINER_MODE=yes make build-package


# TOPDIR := 'TOPDIR-unset'
# SOURCEDIR := $(TOPDIR)/SOURCES/mlton-$(VERSION)
# .PHONY: rpms
# rpms:
# 	$(MAKE) clean clean-svn version
# 	mkdir -p "$(TOPDIR)"
# 	cd "$(TOPDIR)" && mkdir -p BUILD RPMS/i386 SOURCES SPECS SRPMS
# 	rm -rf "$(SOURCEDIR)"
# 	mkdir -p "$(SOURCEDIR)"
# 	( cd "$(SRC)" && tar -cpf - . ) | ( cd "$(SOURCEDIR)" && tar -xpf - )
# 	$(CP) "$(SOURCEDIR)/$(SPEC)" "$(TOPDIR)/SPECS/mlton.spec"
# 	( cd "$(TOPDIR)/SOURCES" && tar -cpf - mlton-$(VERSION) )		\
# 		| $(GZIP) >"$(SOURCEDIR).tgz"
# 	rm -rf "$(SOURCEDIR)"
# 	rpm -ba --quiet --clean "$(TOPDIR)/SPECS/mlton.spec"
