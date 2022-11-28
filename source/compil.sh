#!/bin/bash
g++ -Ofast stencil.cxx -o stencil_comp_test -fopenmp -mcpu=native -finline-functions -funroll-loops -ftree-loop-vectorize -ftree-vectorize
