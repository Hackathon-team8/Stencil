#!/usr/bin/env bash
#SBATCH --nodes=1 --cpus-per-task 16
#SBATCH -o job.%J.out
#SBATCH  --exclusive
#SBATCH  -p basic-slurm

# To submit the script run the command sbatch stencil-big-test.sbatch
# big in the line above is the Slurm queue name, please check it is correct.

export OMP_NUM_THREADS=16
export OMP_PROC_BIND=TRUE
/usr/bin/time ./stencil 1000 1000 1000 10

