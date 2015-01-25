set term pdfcairo noenhanced color solid font 'Myriad Pro,12' size 17.0cm,8.5cm
set output 'comparison.pdf'

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

set bmargin 8.0

set yrange [0.0:1.2]

set key outside center top horizontal autotitle columnheader reverse samplen 1 title ""

set ylabel "Runtime Overhead (normalized)"

plot 'comparison.dat' using 2:xticlabels(1) linecolor rgb "#666666", \
	                 '' using 0:2:2 with labels left offset -4.5,0.25 rotate by 90 font "Myriad Pro,11" notitle, \
                   '' using 3:xticlabels(1) linecolor rgb "#777777", \
	                 '' using 0:3:3 with labels left offset -2.6,0.25 rotate by 90 font "Myriad Pro,11" notitle, \
                   '' using 4:xticlabels(1) linecolor rgb "#888888", \
	                 '' using 0:4:4 with labels left offset -0.7,0.25 rotate by 90 font "Myriad Pro,11" notitle, \
                   '' using 5:xticlabels(1) linecolor rgb "#999999", \
	                 '' using 0:5:5 with labels left offset 1.2,0.25 rotate by 90 font "Myriad Pro,11" notitle, \
                   '' using 6:xticlabels(1) linecolor rgb "#AAAAAA", \
	                 '' using 0:6:6 with labels left offset 3.1,0.25 rotate by 90 font "Myriad Pro,11" notitle, \
                   '' using 7:xticlabels(1) linecolor rgb "#BBBBBB", \
	                 '' using 0:7:7 with labels left offset 5.0,0.25 rotate by 90 font "Myriad Pro,11" notitle, \
                   '' using 8:xticlabels(1) linecolor rgb "#CCCCCC", \
	                 '' using 0:8:8 with labels left offset 7.0,0.25 rotate by 90 font "Myriad Pro,11" notitle
