set term pdfcairo enhanced color solid font 'Myriad Pro,12' size 17.0cm,8.5cm
set output 'micro.pdf'

set style data histogram
set style histogram cluster gap 2.0
set style fill solid 1.0 border rgb "#000000"

set border 3
set tics out

set xtics 1000 nomirror rotate by -60 scale 0
set ytics nomirror
set grid y

set ytics
set yrange [0:10000]

set key inside right top autotitle columnheader samplen 1

set ylabel "Execution Time (cycles)"

plot 'micro.dat' using 2:xtic(1) linecolor rgb '#FFFFFF' title "native", \
	            '' using 0:2:2 with labels left offset -2.5,0.25 rotate by 90 font "Myriad Pro,11" notitle, \
              '' using 3:xtic(1) linecolor rgb '#666666' title "intercept", \
	            '' using 0:3:3 with labels left offset -0.75,0.25 rotate by 90 font "Myriad Pro,11" notitle, \
              '' using 4 linecolor rgb '#999999' title "leader", \
	            '' using 0:4:4 with labels left offset 1.0,0.25 rotate by 90 font "Myriad Pro,11" notitle, \
              '' using 5 linecolor rgb '#CCCCCC' title "follower", \
	            '' using 0:5:5 with labels left offset 3.0,0.25 rotate by 90 font "Myriad Pro,11" notitle
