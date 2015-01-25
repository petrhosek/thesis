set term pdfcairo noenhanced color solid font 'Myriad Pro,12' size 17.0cm,8.5cm
set output 'macro.pdf'

set style data histogram
set style histogram clustered gap 2.0
set style fill solid 1.0 border rgb "#000000"

set border 3
set tics out

#set boxwidth 0.5 relative
#set style fill solid 1.0 noborder

set xtics 1000 nomirror rotate by -60 scale 0
set ytics nomirror
set grid y

set bmargin 11.0

set yrange [0.5:2.0]

set key inside right top autotitle columnheader reverse samplen 1 title "N"

set ylabel "Runtime Overhead (Normalized)"

plot newhistogram "(a) C10k", 'c10k.dat' using 2:xticlabels(1) linecolor rgb "#666666", \
                                      '' using 3:xticlabels(1) linecolor rgb "#777777", \
                                      '' using 4:xticlabels(1) linecolor rgb "#888888", \
                                      '' using 5:xticlabels(1) linecolor rgb "#999999", \
                                      '' using 6:xticlabels(1) linecolor rgb "#AAAAAA", \
                                      '' using 7:xticlabels(1) linecolor rgb "#BBBBBB", \
                                      '' using 8:xticlabels(1) linecolor rgb "#CCCCCC", \
     newhistogram "(b) Comparison", 'comparison.dat' using 2:xticlabels(1) linecolor rgb "#666666" notitle, \
                                                  '' using 3:xticlabels(1) linecolor rgb "#777777" notitle, \
                                                  '' using 4:xticlabels(1) linecolor rgb "#888888" notitle, \
                                                  '' using 5:xticlabels(1) linecolor rgb "#999999" notitle, \
                                                  '' using 6:xticlabels(1) linecolor rgb "#AAAAAA" notitle, \
                                                  '' using 7:xticlabels(1) linecolor rgb "#BBBBBB" notitle, \
                                                  '' using 8:xticlabels(1) linecolor rgb "#CCCCCC" notitle
