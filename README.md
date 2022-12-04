# Stencil

## Team 8

# Compilation:
Before loading you need to load some modules, it can be done by typing:
```
source load
```
To compile
```bash
./compil.sh
```

# Run:
```bash
./exec.sh
```
Depending on which cluster the program is being submitted to, it may be necessary to change the partition's name in the file sbatch_file/stencil-big-test.sbatch as it is a placeholder  
And please be aware that the full path to the Stencil binary compiled is necessary to launch the job successfully.
