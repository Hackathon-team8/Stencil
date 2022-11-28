#!/usr/bin/env bash
./base_stencil 100 100 100 $1 > result_base.dat


./compil.sh
./stencil 100 100 100 $1 > result_accelerated.dat

python3 test_result.py $1
