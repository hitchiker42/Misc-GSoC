#!/bin/bash
help(){
    echo -e "\t m|mlton-opts, arguments to pass to mlton verbatum"
    exit 0
}
TEMP=$(getopt -o a:,c:,k:,o:,m:\
-l align:,as-opt:,cc-opt:,keep:,output:,mlton-opts: \
-n 'mlton-compile.sh' -- "&@")
while true;do
    case "$1" in
        a|align) align="$2";shift 2 ;;
        as-opt) as_opts="$2";shift 2;;
        c|cc-opt) cc_opts="$2";shift 2;;
        o|output) output_file="$2";shift 2;;
        k|keep)
            for i in $(echo "$1" | tr ',' ' ');do
                case "$i" in
                    build-constants)keep="$keep $1";shift;;
                    core-ml)keep="$keep $1";shift;;
                    
                esac
            done
            shift 2;;
        m|mlton-opts)
        --) shift;break;;
        *) echo "Internal error on argument parsing, remaining args $@"; exit 1;;
    esac
done
#set defaults values


#current mlton Script(cat <<"EOF"
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
        $default_opts                                          \\
        "\$@"
EOF
)
