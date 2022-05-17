#!/bin/bash
#BSUB -q gold
#BSUB -o out.%J.txt
#BSUB -e error.%J.txt
#BSUB -J sin_c2dbbse
#BSUB -n 72
##BSUB -R "span[ptile=72]"
#BSUB -R "span[hosts=1]"

source /etc/profile
module load gold/vasp/vasp544_avx512_intel2018
#Run MultiTheads per MPI Process
#-genv OMP_NUM_THREADS 1
export OMP_NUM_THREADS=1
#################export LD_PRELOAD=/share/apps/glibc-2.14/lib/libc-2.14.so
####vaspkit生成KPOINTS POTCAR
	
vaspkit -task 103
wait
########vaspkit -task 102
echo -e "922\n18" | vaspkit
mv POSCAR_REV POSCAR
wait
rm WAVECAR* WAVEDER*

cp INCAR.DFT INCAR
mpirun -genv I_MPI_FABRICS shm -bootstrap lsf vasp_std > stdout_dft.txt
cp OUTCAR OUTCAR.DFT
cp vasprun.xml vasprun.DFT.xml

###NBANDS change
python nba.py >nbalog
###all change NBANDS

cp INCAR.DIAG INCAR
mpirun -genv I_MPI_FABRICS shm -bootstrap lsf vasp_std > stdout_diag.txt
touch done_diag
cp OUTCAR OUTCAR.DIAG
cp vasprun.xml vasprun.DIAG.xml
./extract_optics.sh
mv optics.dat optics.DFT.dat

# cp WAVECAR WAVECAR.chi
# cp WAVEDER WAVEDER.chi
# cp INCAR.scGW0 INCAR
# $vasp_std
# cp OUTCAR OUTCAR.scGW0
# cp vasprun.xml vasprun.scGW0.xml

cp INCAR.GW0 INCAR
mpirun -genv I_MPI_FABRICS shm -bootstrap lsf vasp_std > stdout_gw0.txt
touch done_gw
cp OUTCAR OUTCAR.GW0
cp vasprun.xml vasprun.GW0.xml

cp INCAR.NONE INCAR
mpirun -genv I_MPI_FABRICS shm -bootstrap lsf vasp_std > stdout_none.txt
touch done_none
cp OUTCAR OUTCAR.NONE
cp vasprun.xml vasprun.NONE.xml
./extract_optics.sh
mv optics.dat optics.RPA.dat

cp INCAR.BSE INCAR
mpirun -genv I_MPI_FABRICS shm -bootstrap lsf vasp_std > stdout_bse.txt
touch done_bse
cp OUTCAR OUTCAR.BSE
cp vasprun.xml vasprun.BSE.xml
./extract_optics.sh
mv optics.dat optics.BSE.dat
wait
touch done_all
rm WAVECAR CHG CHGCAR *.tmp -r
