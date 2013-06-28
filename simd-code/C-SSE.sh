#!/bin/bash
mlton -default-ann 'allowFFI true' -cc-opt "-O2" -output C-SSE.o C-SSE.mlb C-SSE.c