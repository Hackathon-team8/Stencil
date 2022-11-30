#!/usr/bin/env bash
#SBATCH --nodes=1 
#SBATCH -o job.%J.out
#SBATCH  --exclusive
#SBATCH  -p basic-slurm
#SBATCH -c <OMP_NUM_THREADS>

# To submit the script run the command sbatch stencil-big-test.sbatch
# big in the line above is the Slurm queue name, please check it is correct.

export OMP_NUM_THREADS=<OMP_NUM_THREADS>
# ./stencil 1000 1000 1000 10
<run_command>
