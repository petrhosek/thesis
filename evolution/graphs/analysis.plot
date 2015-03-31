set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,5.5cm
if (!exists("filename")) filename='analysis.pdf'
set output filename

set multiplot layout 1,2

set grid x
set yrange [0:1.0]
set key left

set bmargin 3.0

set style line 1 lc rgb '#666666' lt 1 lw 2 pt 1 ps 1
set style line 2 lc rgb '#CCCCCC' lt 2 lw 1 pt 2 ps 1

set ylabel "Differences (normalized)"

set title "Lighttpd 1.4" offset 0,-0.6
set xtics (2436,2466,2524,2550,2578,"2606" 2603,2612) nomirror rotate by -60 scale 0 font "MyriadPro,10"
plot 'traces-lighttpd.dat' using 1:2 ls 1 t 'Traces' w lines, \
                        '' using 1:3 ls 2 t 'Code' w lines

set title "Vim" offset 0,-0.6
set xtics ("7.1.017" 15,"7.1.025" 23, "7.1.045" 43, "7.1.186" 184, "7.1.256" 254, "7.1.270" 268, "7.1.296" 294) nomirror rotate by -60 scale 0 font "MyriadPro,10"
plot 'traces-vim.dat' using (column(0)):2 ls 1 t 'Traces' w lines, \
                   '' using (column(0)):3 ls 2 t 'Code' w lines
