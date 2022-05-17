#!/bin/bash
#BSUB -q gold
#BSUB -o out.%J.txt
#BSUB -e error.%J.txt
#BSUB -J c2dbbse
#BSUB -n 36
##BSUB -R "span[ptile=72]"
#BSUB -R "span[hosts=1]"

source /etc/profile
module load gold/vasp/vasp544_avx512_intel2018
#Run MultiTheads per MPI Process
#-genv OMP_NUM_THREADS 1
export OMP_NUM_THREADS=1
##########export LD_PRELOAD=/share/apps/glibc-2.14/lib/libc-2.14.so
python c2dbbse.py>log
####vaspkit生成KPOINTS POTCAR	
