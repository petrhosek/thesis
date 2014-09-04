set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,8.0cm
set output "eloctloc.pdf"

set multiplot layout 2,3

set ylabel "Revisions"
set ytics mirror 50
set xrange [0:]
set noxtics
set key left top
set style line 1 lc rgb '#00B5E5' lt 1 lw 2 pt 1 ps 1
set style line 2 lc rgb '#CB2027' lt 2 lw 1 pt 2 ps 1
set yrange [0:250]

set title "Binutils" offset 0,-0.6
plot 'eloctloc-binutils.dat' using 2 ls 1 t "Code" w lines, \
                          '' using 3 ls 2 t "Test" w lines #axes x1y2

set title "Git" offset 0,-0.6
plot 'eloctloc-git.dat' using 2 ls 1 t "Code" w lines, \
                     '' using 3 ls 2 t "Test" w lines #axes x1y2

set title "Lighttpd" offset 0,-0.6
plot 'eloctloc-lighttpd.dat' using 2 ls 1 t "Code" w lines, \
                         '' using 3 ls 2 t "Test" w lines #axes x1y2

set title "Memcached" offset 0,-0.6
plot 'eloctloc-memcached.dat' using 2 ls 1 t "Code" w lines, \
                           '' using 3 ls 2 t "Test" w lines #axes x1y2

set title "Redis" offset 0,-0.6
plot 'eloctloc-redis.dat' using 2 ls 1 t "Code" w lines, \
                       '' using 3 ls 2 t "Test" w lines #axes x1y2

set title "ØMQ" offset 0,-0.6
plot 'eloctloc-zeromq.dat' using 2 ls 1 t "Code" w lines, \
                        '' using 3 ls 2 t "Test" w lines #axes x1y2
