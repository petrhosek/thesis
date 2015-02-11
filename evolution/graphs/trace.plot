set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,5.0cm
set output "trace.pdf"

#set multiplot layout 1,3
set multiplot layout 1,2

set xlabel ""
set ylabel "ELOC"
set xrange [0:]
set noxtics
set style line 1 lc rgb '#00B5E5' lt 1 lw 2 pt 1 ps 1
set style line 2 lc rgb '#CB2027' lt 2 lw 1 pt 2 ps 1
set yrange [0:250]

set title "Lighttpd 1.4" offset 0,-0.6
plot 'trace-lighttpd1.4.dat' using 2 ls 1 t "Code" w lines, \
                          '' using 3 ls 2 t "Trace" w lines #axes x1y2

set title "Lighttpd 2.0" offset 0,-0.6
plot 'trace-lighttpd2.dat' using 2 ls 1 t "Code" w lines, \
                        '' using 3 ls 2 t "Trace" w lines #axes x1y2

#set title "Memcached" offset 0,-0.6
#plot 'trace-memcached.dat' using 2 ls 1 t "Code" w lines, \
#                        '' using 3 ls 2 t "Trace" w lines #axes x1y2
