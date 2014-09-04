set term pdfcairo enhanced color solid font 'MyriadPro,10' size 17.0cm,7.0cm
set output 'spec2006.pdf'

set style data histogram
set style histogram cluster gap 3.5
set style fill solid 1.0 border rgb "#000000"

set border 3
set tics out

set xtics 1000 nomirror rotate by -45 scale 0
set ytics nomirror
set grid y

set ytics
set yrange [0:2]

set key rmargin center autotitle columnheader

set ylabel "Execution Time (Normalized)"

plot 'spec2006.dat' using 2:xticlabels(1) linecolor rgb '#999999', \
                 '' using 3:xticlabels(1) linecolor rgb '#AAAAAA'
