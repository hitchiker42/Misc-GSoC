#!/bin/bash
mlton -default-ann 'allowFFI true' -cc-opt "-O2 -flax-vector-conversions -msse2" C-SSE2_test.mlb ../C-SSE2.c