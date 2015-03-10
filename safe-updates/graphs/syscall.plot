set term pdfcairo enhanced color solid font 'MyriadPro,12' size 7.0cm,17.0cm
if (!exists("filename")) filename='syscall.pdf'
set output filename

set style data histogram
set style histogram gap 1
set style fill solid border -1

set nokey

set boxwidth 1.5
set border 9
set rmargin 4
set lmargin 1
set tmargin 3
set bmargin 8

set tics out
set xtics in scale 0,0 nomirror rotate
unset ytics
set y2tics nomirror rotate

set yrange [0:350]
set xrange[-0.5:11.5]

set xlabel 'Average number of system calls performed per second'
set grid y2

plot 'syscall.dat' using 2:xtic(1) linecolor rgb '#aaaaaa' notitle, \
	              '' using 0:2:2 with labels left offset 0,0.5 rotate notitle \
