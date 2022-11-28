#!/bin/bash
g++ -Ofast stencil.cxx -o stencil -fopenmp -march=native -mtune=native -finline-functions -funroll-loops -ftree-loop-vectorize -ftree-vectorize
