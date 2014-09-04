set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,7.0cm
set output 'spec2000.pdf'

set style data histogram
set style histogram clustered gap 1.5
set style fill solid 1.0 border rgb "#000000"

set border 3
set tics out

#set boxwidth 0.9 relative
#set style fill solid 1.0 noborder

set xtics 1000 nomirror rotate by -45 scale 0
set ytics nomirror
set grid y

set yrange [0.0:7.0]

set key rmargin center autotitle columnheader reverse samplen 1 title "N"

set ylabel "Runtime Overhead (Normalized)"

plot 'spec2000.dat' using 2:xticlabels(1) linecolor rgb "#666666", \
                 '' using 3:xticlabels(1) linecolor rgb "#777777", \
                 '' using 4:xticlabels(1) linecolor rgb "#888888", \
                 '' using 5:xticlabels(1) linecolor rgb "#999999", \
                 '' using 6:xticlabels(1) linecolor rgb "#AAAAAA", \
                 '' using 7:xticlabels(1) linecolor rgb "#BBBBBB", \
                 '' using 8:xticlabels(1) linecolor rgb "#CCCCCC"
