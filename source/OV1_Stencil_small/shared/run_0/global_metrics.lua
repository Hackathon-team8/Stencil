_report = {
  metrics = {
    experiment_type = "Sequential",
    user_time = 11.11,
    iterations_count = "Not Available",
    compilation_flags = "stencil: \n",
    speedup_if_perfect_openmp = "Not Available",
    __name = "run_0",
    nb_loops_80_if_L1 = "Not Available",
    loops_time = 11.11,
    speedup_if_fp_vect = 1.0191,
    speedup_if_perfect_MPI_OMP_PTHREAD_LOAD_DISTRIBUTION = 1,
    speedup_if_perfect_MPI_OMP_PTHREAD = 1,
    nb_loops_80_if_FP_only = 1,
    GFlops = "Not Implemented Yet",
    speedup_if_L1 = "Not Available",
    GBs = "Not Implemented Yet",
    nb_loops_80_if_fully_vect = 1,
    nb_loops_80_if_perfect_openmp = "Not Available",
    nb_loops_80_if_clean = 1,
    speedup_if_fully_vectorised = 1.0694,
    nb_loops_80_if_fp_vect = 1,
    flow_complexity = 1,
    speedup_if_clean = 1.038,
    profiled_time = 0.09,
    array_access_efficiency = "Not Available",
    crest_performance = "Not Implemented Yet",
    number_processes = 1,
    speedup_if_FP_only = 1.0643,
    nb_threads = 1,
    application_time = 0.10270900279284,
    compilation_options = 25,
    innerloops_time = 11.11,
  },
  help = {
    user_time = "Percentage of the application time spent in user code (meaning the time spent in the binary and external libraries specified in custom_categories).",
    iterations_count = "Optimistic speedup available by increasing the number of iterations in loops. Having low iteration count loops can decrease\nperformances.\nLower is better.",
    speedup_if_perfect_openmp = "Optimistic speedup if OpenMP is perfectly balanced.\nLower is better.",
    nb_loops_80_if_L1 = "Number of loops to optimize to get 80% of the speedup.\nLower is better.",
    loops_time = "Percentage of the application time spent in loops (excluding loops present in modules not analyzed by the profiler). It represents 0.01 seconds.",
    speedup_if_fp_vect = "Optimistic speedup if all floating point instructions are vectorized in all analyzed loops. Memory instructions are not considered as vectorized.\nLower is better.",
    speedup_if_perfect_MPI_OMP_PTHREAD_LOAD_DISTRIBUTION = "Optimistic speedup if OpenMP, MPI and Pthread runtimes are perfect and the load distribution if perfect.\nLower is better.\nThis metric presents an estimation of the speed-up at application level if most common parallel bottelnecks are perfect.\nspeedup = MAX (time) / AVG (time without OpenMP, MPI and Pthread)",
    speedup_if_perfect_MPI_OMP_PTHREAD = "Optimistic speedup if OpenMP, MPI and Pthread runtimes are perfect.\nLower is better.\nThis metric presents an estimation of the speed-up at application level if the MPI/OpenMP/Pthread behaviour is perfect.\nspeedup = MAX (time) / MAX (time without OpenMP, MPI and Pthread)",
    nb_loops_80_if_FP_only = "Number of loops to optimize to get 80% of the speedup.\nLower is better.",
    GFlops = "<TBD>.\n",
    speedup_if_L1 = "Optimistic speedup if all memory accesses are located in the L1 cache for all analyzed loops.\nLower is better.",
    GBs = "<TBD>.\n",
    nb_loops_80_if_fully_vect = "Number of loops to optimize to get 80% of the speedup.\nLower is better.",
    nb_loops_80_if_perfect_openmp = "Number of loops to optimize to get 80% of the speedup.\nLower is better.",
    nb_loops_80_if_clean = "Number of loops to optimize to get 80% of the speedup.\nLower is better.",
    speedup_if_fully_vectorised = "Optimistic speedup if all instructions are vectorized in all analyzed loops.\nLower is better.",
    nb_loops_80_if_fp_vect = "Number of loops to optimize to get 80% of the speedup.\nLower is better.",
    flow_complexity = "Optimistic speedup available by reducing the number of paths in loops. Having multiple paths in a loop can prevent\nthe compiler to vectorize the code, decreasing performances. The metric provides an estimation of a global speedup that\ncan be achieved if all loops with more than two paths were fully vectorized.\nLower is better.",
    speedup_if_clean = "Optimistic speedup if all instructions performing addresses computations and scalar integer computations have been deleted. \nLower is better.",
    profiled_time = "Application profiling duration in seconds<br><b>Too short run</b>: profiling results are not statistically significant (profiled time corresponds to 18 samples) and should not be used<br><b>Workaround</b>: Rerun with a longer workload and/or use sampling-rate=high/highest in lprof_params",
    array_access_efficiency = "Processor friendly data layout. Accessing contiguous data is faster.\nHigher is better.",
    crest_performance = "<TBD>.\n",
    speedup_if_FP_only = "Optimistic speedup if only arithmetic floating point instructions are kept.\nLower is better.",
    application_time = "Time spent by the application in seconds",
    compilation_options = "Global score based on basic options to use with the compiler to have good performance.",
    innerloops_time = "Percentage of the application time spent in innermost loops (excluding loops present in modules not analyzed by the profiler). It represents 0.01 seconds.",
  },
  colors = {
    iterations_count = "00FF3333",
    speedup_if_perfect_openmp = "00FF3333",
    nb_loops_80_if_L1 = "00FF3333",
    speedup_if_fp_vect = "0066cc00",
    speedup_if_perfect_MPI_OMP_PTHREAD_LOAD_DISTRIBUTION = "0066cc00",
    speedup_if_perfect_MPI_OMP_PTHREAD = "0066cc00",
    speedup_if_L1 = "00FF3333",
    nb_loops_80_if_perfect_openmp = "00FF3333",
    speedup_if_fully_vectorised = "0066cc00",
    flow_complexity = "0066cc00",
    speedup_if_clean = "0066cc00",
    profiled_time = "00FF3333",
    array_access_efficiency = "00FF3333",
    speedup_if_FP_only = "0066cc00",
    compilation_options = "00FF950E",
  },
  comp_opt_report = {
    ["stencil#"] = {
      opts = "",
      score = "0.25",
      issues = {"-g is missing, it is needed to have more accurate reports. ", "-O2, -O3 or -Ofast is missing. ", "-x(target) or -ax(target) is missing. ", },
    },
  },
}
