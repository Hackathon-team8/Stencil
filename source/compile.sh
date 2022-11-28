#!/bin/bash
g++ -Ofast stencil.cxx -o stencil -fopenmp -mcpu=native -finline-functions -funroll-loops -ftree-loop-vectorize -ftree-vectorize
