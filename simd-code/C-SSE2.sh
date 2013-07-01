#!/bin/bash
mlton -default-ann 'allowFFI true' -cc-opt "-O2" -output C-SSE2.o C-SSE2.mlb C-SSE2.c