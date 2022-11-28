#!/usr/bin/env bash
./base_stencil 100 100 100 5 > result_base.dat


./compil.sh
./stencil 100 100 100 5 > result_accelerated.dat

python3 test_result.py
