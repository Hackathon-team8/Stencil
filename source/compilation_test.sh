#!/usr/bin/env bash
./base_stencil 100 100 100 5 > result_stencil.dat


./compil.sh
./stencil 100 100 100 5 > result_compil.dat

python3 test_result.py
