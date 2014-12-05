set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,12.0cm
set output 'traces.pdf'

set multiplot layout 2,1

set grid x
set yrange [0:1.0]
set key left

set style line 1 lc rgb '#00B5E5' lt 1 lw 2 pt 1 ps 1
set style line 2 lc rgb '#CB2027' lt 2 lw 1 pt 2 ps 1

set ylabel "Differences"

set title "Lighttpd" offset 0,-0.6
set xtics (2436,2466,2524,2550,2578,"2606" 2603,2612) nomirror rotate by -45 scale 0
plot 'traces-lighttpd.dat' using 1:2 ls 1 t 'Traces' w lines, \
                        '' using 1:3 ls 2 t 'Sources' w lines

set title "Vim" offset 0,-0.6
set xtics ("7.1.017" 15,"7.1.025" 23, "7.1.045" 43, "7.1.186" 184, "7.1.256" 254, "7.1.270" 268, "7.1.296" 294) nomirror rotate by -45 scale 0
plot 'traces-vim.dat' using (column(0)):2 ls 1 t 'Traces' w lines, \
                   '' using (column(0)):3 ls 2 t 'Sources' w lines
