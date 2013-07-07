#!/bin/bash
temp=$1
shift
case "$temp" in
    1) mlton "$@" -default-ann 'allowFFI true' -cc-opt "-O2" -output C-SSE.o C-SSE.mlb C-SSE.c
        ;;
    2) mlton "$@"  -default-ann 'allowFFI true' -cc-opt "-O2 -flax-vector-conversions" -output C-SSE2.o C-SSE2.mlb C-SSE2.c
        ;;
    3) mlton -default-ann 'allowFFI true' -cc-opt "-O2" -output C-SSE3.o C-SSE3.mlb C-SSE3.c
        ;;
    4) mlton -default-ann 'allowFFI true' -cc-opt "-O2" -output C-SSE4.o C-SSE4.mlb C-SSE4.c
        ;;
esac
