#!/bin/bash
mlton -default-ann 'allowFFI true' -cc-opt "-O2" -output C-SSE4.o C-SSE4.mlb C-SSE4.c