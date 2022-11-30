experiment_name = nil
comments = nil
executable     = "./stencil"
run_command    = "<executable> 1000 1000 1000 2"
batch_script    = "stencil-big-test-OV1.sbatch"
batch_command   = "sbatch"
number_processes = 1
number_nodes = 1
mpi_command    = ""
pinning_command    = ""
filter = {
   type = "number",
   value = 10,
}
profile_start = {
   unit = "none",
   value = 0,
}
run_directory  = "."
dataset        = ""
dataset_handler= "link"
-- frequencies    = {}
decan_multi_variant = true
decan_all_variants = true
decan_threshold = 500
maximal_path_number = 4
is_sudo_available = false
lprof_params = ''
lprof_post_process_params = {
}
vprof_params = ""
decan_params = ""
cqa_params = {}
keep_executable_location = false
multiruns_params = {}
scalability_reference = "main"
base_run_name = "run_0"
environment_variables = {
  {name = "OMP_NUM_THREADS", value = "16"},
}
script_variables = {
}
qplot_script = nil
thread_filter_threshold = "0%"
object_coverage_threshold = 0.01
repetitions = 31
ranges_count = 20
outliers_count = 0
