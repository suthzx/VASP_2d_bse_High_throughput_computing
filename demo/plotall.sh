cat >plotfile<<!
# set term postscript enhanced eps colour lw 2 "Helvetica" 20
# set output "optics.eps"

set xrange [0:10]

plot "optics.DFT.dat" using (\$1):(\$2)  w l lt -1 lw 1  lc -1 title "DFT", \
     "optics.RPA.dat" using (\$1):(\$2)  w l lt -1 lw 1  lc  1 title "RPA", \
     "optics.BSE.dat" using (\$1):(\$2)  w l lt -1 lw 1  lc  3 title "BSE"
!

gnuplot -persist plotfile
