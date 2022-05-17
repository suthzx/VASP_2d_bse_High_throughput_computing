#!/bin/bash
#BSUB -q normal
#BSUB -o out.%J.txt
#BSUB -e error.%J.txt
#BSUB -J c2dbbse
#BSUB -n 8
##BSUB -R "span[ptile=16]"
#BSUB -R "span[hosts=1]"

#source /share/apps/intel/ipsxe2016/parallel_studio_xe_2016.0.047/psxevars.sh >/dev/null 2>&1
source /share/apps/intel/ipsxe2015u5/parallel_studio_xe_2015/psxevars.sh >/dev/null 2>&1
export LD_PRELOAD=/share/apps/glibc-2.14/lib/libc-2.14.so

#Run MultiTheads per MPI Process
#-genv  OMP_NUM_THREADS 1
export OMP_NUM_THREADS=1

#Run MPI over infiniband
#mpirun -genv I_MPI_FABRICS tmi -bootsyrap lsf /share/apps/vasp.5.3.3.intel2015u5/vasp.5.3/vasp

#Run MPI within one Compute Note;
#####conda activate pyxtal
python c2dbbse.py>log
####mpirun -genv I_MPI_FABRICS shm -bootstrap lsf /share/apps/vasp.5.3.3.intel2015u5/vasp.5.3/vasp>result




