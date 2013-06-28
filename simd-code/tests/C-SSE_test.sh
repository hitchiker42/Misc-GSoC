#!/bin/bash
mlton -default-ann 'allowFFI true' -cc-opt "-O2" C-SSE_test.mlb ../C-SSE.c