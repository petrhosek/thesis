set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,8.5cm
if (!exists("filename")) filename='spec2006.pdf'
set output filename

set style data histogram
set style histogram cluster gap 1.5
set style fill solid 1.0 border rgb "#000000"

set border 3
set tics out

set xtics 1000 nomirror rotate by -60 scale 0
set ytics nomirror
set grid y

set ytics
set yrange [0:2]

set key rmargin center autotitle columnheader

set ylabel "Execution Time (Normalized)"

plot 'spec2006.dat' using 2:xticlabels(1) linecolor rgb '#888888', \
                 '' using 3:xticlabels(1) linecolor rgb '#BBBBBB'
