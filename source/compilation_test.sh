#!/usr/bin/env bash

./base_compil.sh
./stencil 100 100 100 5 > result_stencil.dat


./compil.sh
./stencil_comp_test 100 100 100 5 > result_compil.dat

python3 test_result.py
