set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,9.0cm
set output 'traces.pdf'

set multiplot layout 2,1

set style fill solid border -1
set key under nobox

set boxwidth 1.5
set border 3

set rmargin 1
set lmargin 9
set tmargin 2
set bmargin 6

set tics out

set xtics (2436,2466,2524,2550,2578,"2606" 2603,2612) nomirror rotate by -45 scale 0
set ytics nomirror

set grid x
set yrange [0:1.0]
set xrange [0:]
#set xrange [2379:2635]

set xlabel "Revisions"
set ylabel "Differences (Normalized)"

set title "Lighttpd" offset 0,-0.6
plot 'traces-lighttpd.dat' using 1:2 with lines linecolor rgb '#00B5E5' title 'traces', \
                        '' using 1:3 with lines linecolor rgb '#CB2027' title 'source code'

set title "Vim" offset 0,-0.6
plot 'traces-vim.dat' using 1:2 with lines linecolor rgb '#00B5E5' title 'traces', \
                   '' using 1:3 with lines linecolor rgb '#CB2027' title 'source code'
