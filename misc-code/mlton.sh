#!/usr/bin/env bash
#Script to generate a platform dependend mlton script
#Rather than deducing the platform and necessary options each time
#mlton is called, do it once and generate a script with platform dependent
#variables builtin

help(){  
  echo -e "usage: mlton.sh [options]\nOptions:"
    echo -e "\t -h|--help print this help and exit"
    echo -e "\t -v|--version print version information"
    echo -e "\t -d|--default generate script using default options"
    echo -e "\t --prefix DIR:prefix for mlton & mlton libs [/usr/local]"
    echo -e "\t --libdir DIR:location of mlton libs [/usr/local/lib]"
    echo -e "\t --bindir DIR:location of mlton excutable (aka. this script)
\t\t[/usr/local/bin]"
    echo -e "\t -f|--file FILE: name of mlton excutable
\t\t[mlton], if host=mingw append .exe"
    echo -e "\t -a|--arch ARCH: generate script for architecture ARCH
\t\tdefault determined by current architecture"
    echo -e "\t -c|--cc FILE: name of default c compiler [gcc]"
    echo -e "\t -o|--os OS: generate script for operating system OS
\t\tdefault deturmined by current os"
    echo -e "\t -r|--ram NUM: Default ram usage of mlton
\t\tgiven as a number from 0-1 as a % of total ram [0.25]"
    exit 0
}
source $(dirname "$0")/platform #functions to get host-os & host-arch
VERSION="0.01"
[[ $# = 0 ]] && help
#run getopt on args
TEMP=$(getopt -o a:,c:,f:,h,o:,v,d \
-l prefix:,libdir:,bindir:,file:,os:,arch:,cc:,help,version,default \
-n 'mlton.sh' -- "$@")
if [ $? != 0 ] ; then echo "Getopt failed, error $?" >&2 ; exit 1 ; fi

eval set -- "$TEMP"
#parse args
while true;do
    case "$1" in
        -h|--help) help;;
        -v|--version) echo "mlton.sh version $VERSION"; exit 0;;
        --prefix) prefix="$2";shift 2;;
        --libdir) libdir="$2";shift 2;;
        --bindir) bindir="$2";shift 2;;
        -o|--os) HOST_OS="$2";shift 2;;
        -a|--arch) HOST_ARCH="$2";shift 2;;
        -f|--file) script="$2";shift 2;;
        -c|--cc) CC="$2";shift 2;;
        -r|--ram)ram_slop="$2";shift 2;;
        --) shift ; break;;
        *) echo "Internal error!, remaining args: $@"; exit 1 ;;
    esac
done
#set variables to defaults if not set by args
#I could do something like var=${var:-default},but I think this looks cleaner
[[ -z "$prefix" ]] && prefix=/usr/local
[[ -z "$libdir" ]] && libdir=$prefix/lib
[[ -z "$bindir" ]] && bindir=$prefix/bin
[[ -z "$HOST_ARCH" ]] && HOST_ARCH=$(get_arch)
[[ -z "$HOST_OS" ]] && HOST_OS=$(get_os)
[[ -z "$CC" ]] && CC=gcc
[[ -z "$ram_slop" ]] && ram_slop=0.25
#os specific options
case "$HOST_OS" in
    mingw)
        [[ -z "$script" ]] && script=$bindir/mlton.exe
        mlton_compile="$libdir/mlton-compile.exe"
        mlton_polyml="$libdir/mlton-polyml.exe"
        ;;
    hpux)
        ia64hpux="-mlp64";;
esac
#set excutable name for non windows platforms
if [ "$HOST_OS" != "mingw" ]; then
    [[ -z "$script" ]] && script=$bindir/mlton
    mlton_compile="$libdir/mlton-compile"
    mlton_polyml="$libdir/mlton-polyml"
fi

# For align-{functions,jumps,loops}, we use -m for now instead of
# -f because old gcc's will barf on -f, while newer ones only warn
# about -m.  Someday, when we think we won't run into older gcc's,
# these should be changed to -f.

# You may need to add a line with -cc-opt 'I/path/to/gmp.h' so the
# C compiler can find gmp.h
# You may need to add a line with -link-opt '-L/path/to/libgmp' so
# that the linker can find libgmp.



#set c/ld/as flags
CFLAGS="$CFLAGS -I${libdir}/include -O1 -fno-common -fno-strict-aliasing\
        -fomit-frame-pointer -w"
LDFLAGS="$LDFLAGS -lm -lgmp"
ASFLAGS=" "
case "HOST_OS" in
    aix)
        LDFLAGS="$LDFLAGS -maix64"
        CFLAGS="$CFLAGS -maix64"
        ;;
    cygwin)
        LDFLAGS="$LDFLAGS -lws2_32 -lkernel32 -lpsapi -lnetapi32 -lwinmm\
                 -Wl,--enable-stdcall-fixup"
        ;;
    darwin)
        CFLAGS="$CFLAGS -I/usr/local/include -I/opt/local/include -I/sw/include"
# The darwin linker complains (loudly) about non-existent library
# search paths.
        declare temp
        [[ -d '/usr/local/lib' ]] && temp="-L/usr/local/lib"
        [[ -d '/opt/local/lib' ]] && temp="$temp -L/opt/local/lib"
        [[ -d '/sw/lib' ]] && temp="$temp -L/sw/lib"
        LDFLAGS="$LDFLAGS $temp"
        ;;
    freebsd)
        CFLAGS="$CFLAGS -I/usr/local/include"
        LDFLAGS="$LDFLAGS -L/usr/local/lib/"
        ;;
    linux)  LDFLAGS="$LDFLAGS -Wl,-znoexecstack"
        ;;
    netbsd) 
        CFLAGS="$CFLAGS -I/usr/pkg/include"
        LDFLAGS="$LDFLAGS -Wl,-R/usr/pkg/lib -L/usr/pkg/lib/"
        ;;
    solaris)
        LDFLAGS="$LDFLAGS -lnsl -lsocket -lrt"
esac
case "$HOST_ARCH" in
    alpha)
        CFLAGS="$CFLAGS -mieee -mbwx -mtune=ev6 -mfp-rounding-mode=d"
        LDFLAGS="$LDFLAGS -mieee -mbwx -mtune=ev6 -mfp-rounding-mode=d"
        ;;
    amd64)
        ASFLAGS="-m64"
        LDFLAGS="$LDFLAGS -m64"
        CFLAGS="$CFLAGS -m64"
        ;;
    ia64)
        LDFLAGS="$LDFLAGS $ia64hpux"
        CFLAGS="$CFLAGS $ia64hpux -mtune=itanium2"
        ;;
    sparc)
        CFLAGS="-m32 -mcpu=v8 -Wa,-xarch=v8plusa"
        ;;
    x86)
        ASFLAGS="-m64"
        LDFLAGS="$LDFLAGS -m32"
        CFLAGS="$CFLAGS -m32 -fno-strength-reduce -fschedule-insns \
                -malign-functions=5 -malign-jumps=2 -fschedule-insns2 \
                -malign-loops=2"
        ;;
esac
touch $script
if [ $? != 0 ]; then echo "can not create $script";exit 1;fi
if [ ! -w "$script" ] ; then
    echo "cannot write $script" 
    exit 1
fi
#generate part of script w/out shell expansion (thus the quoted EOF)
(cat <<"EOF"
declare -a rargs
case "$1" in
@MLton)
        shift
        while [ "$#" -gt 0 -a "$1" != "--" ]; do
                rargs[${#rargs[@]}]="$1"
                shift
        done
        if [ "$#" -gt 0 -a "$1" == "--" ]; then
                shift
        else
                echo '@MLton missing --'
                exit 1
        fi
        ;;
esac
EOF
) >$script
#generate part of script w/shell expansion (thus all the backslashes)
(cat <<EOF
HOST_ARCH=$HOST_ARCH
HOST_OS=$HOST_OS
mlton_smlnj_heap=$(ls "$libdir" | grep mlton-smlnj)
doitMLton () {
    exec "$mlton_compile" @MLton ram-slop $ram_slop "\${rargs[@]}" -- "\$@"
}
doitSMLNJ () {
    exec sml @SMLload="$mlton_smlnj_heap" "\$@"
}
doitPolyML () {
    exec "$mlton_polyml" "\$@"
}
doit () {
        if [ -x "$mlton_compile" ]; then
            doitMLton "\$@"
        elif [ -s "\$mlton_smlnj_heap" ]; then
            doitSMLNJ "\$@"
        elif [ -x "$mlton_polyml" ]; then
            doitPolyML "\$@"
        fi
        echo 'Unable to run MLton.  Check that lib is set properly.' >&2
        exit 1
}

doit "$libdir" \\
        -ar-script "$libdir/static-library"                    \\
        -cc $CC                                              \\
        -as-opt "$ASFLAGS"                                     \\
        -cc-opt "$CFLAGS"                                      \\
        -link-opt "$LDFLAGS"                                   \\
        -mlb-path-map "$libdir/mlb-path-map"                   \\
        -profile-exclude '\\\$\\(SML_LIB\\)'                   \\
        "\$@"
EOF
) >>$script
chmod +x $script