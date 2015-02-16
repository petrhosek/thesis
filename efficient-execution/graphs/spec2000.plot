set term pdfcairo enhanced color solid font 'Myriad Pro,14' size 17.0cm,8.5cm
if (!exists("filename")) filename='spec2000.pdf'
set output filename

set style data histogram
set style histogram clustered gap 2.0
set style fill solid 1.0 border rgb "#000000"

set border 3
set tics out

#set boxwidth 0.9 relative
#set style fill solid 1.0 noborder

set xtics 1000 nomirror rotate by -60 scale 0
set ytics nomirror
set grid y

set bmargin 6.5

set yrange [0.0:7.0]

set key outside center top horizontal autotitle columnheader reverse samplen 1 title ""

set ylabel "Runtime Overhead (normalized)"

plot 'spec2000.dat' using 2:xticlabels(1) linecolor rgb "#666666", \
                 '' using 3:xticlabels(1) linecolor rgb "#777777", \
                 '' using 4:xticlabels(1) linecolor rgb "#888888", \
                 '' using 5:xticlabels(1) linecolor rgb "#999999", \
                 '' using 6:xticlabels(1) linecolor rgb "#AAAAAA", \
                 '' using 7:xticlabels(1) linecolor rgb "#BBBBBB", \
                 '' using 8:xticlabels(1) linecolor rgb "#CCCCCC"
