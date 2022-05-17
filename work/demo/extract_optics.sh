awk 'BEGIN{i=0} /<dielectricfunction>/,\
                /<\/dielectricfunction>/ \
                 {if ($1=="<r>") {a[i]=$2 ; b[i]=($3+$4+$5)/3 ; c[i]=$4 ; d[i]=$5 ; i=i+1}} \
     END{for (j=0;j<i/2;j++) print a[j],b[j],b[j+i/2]}' vasprun.xml > optics.dat
