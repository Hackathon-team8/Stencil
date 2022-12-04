#!/usr/bin/env bash
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=64
#SBATCH --threads-per-core=1
#SBATCH -e Stencil_Team8_%J_OUT.e
#SBATCH -o Stencil_Team8_%J_OUT.o
#SBATCH --exclusive
#SBATCH -p slurm-a

export OMP_NUM_THREADS=64
export OMP_PLACES=cores
~/Stencil/stencil 1000 1000 1000 10
