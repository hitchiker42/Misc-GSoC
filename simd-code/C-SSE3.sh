#!/bin/bash
mlton -default-ann 'allowFFI true' -cc-opt "-O2" -output C-SSE3.o C-SSE3.mlb C-SSE3.c