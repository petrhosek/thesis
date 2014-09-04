set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,12.0cm
set output "tloc.pdf"

set multiplot layout 2,3

set xlabel ""
set ylabel "TLOC"
set xrange [0:]
set noxtics
set style line 1 lc rgb '#CB2027' lt 1 lw 1 pt 1 ps 0.6

set title "Binutils" offset 0,-0.6
plot 'tloc-binutils.dat' using 2 w points ls 1 notitle

set title "Git" offset 0,-0.6
plot 'tloc-git.dat' using 2 w points ls 1 notitle

set title "Lighttpd" offset 0,-0.6
plot 'tloc-lighttpd.dat' using 2 w points ls 1 notitle

set title "Memcached" offset 0,-0.6
plot 'tloc-memcached.dat' using 2 w points ls 1 notitle

set title "Redis" offset 0,-0.6
plot 'tloc-redis.dat' using 2 w points ls 1 notitle

set title "ØMQ" offset 0,-0.6
plot 'tloc-zeromq.dat' using 2 w points ls 1 notitle
