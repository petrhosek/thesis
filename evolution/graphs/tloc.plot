set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,15.0cm
if (!exists("filename")) filename='tloc.pdf'
set output filename

set multiplot layout 3,3

set decimal locale
set format "%'g"

set xlabel ""
set ylabel "TLOC"
set xrange [0:]
set noxtics
set style line 1 lc rgb '#CCCCCC' lt 1 lw 1 pt 1 ps 0.6

set title "Beanstalkd" offset 0,-0.6
plot 'tloc-beanstalkd.dat' using 2 w points ls 1 notitle

set title "Binutils" offset 0,-0.6
plot 'tloc-binutils.dat' using 2 w points ls 1 notitle

set title "Git" offset 0,-0.6
plot 'tloc-git.dat' using 2 w points ls 1 notitle

set title "Lighttpd 1.4" offset 0,-0.6
plot 'tloc-lighttpd1.4.dat' using 2 w points ls 1 notitle

set title "Lighttpd 2.0" offset 0,-0.6
plot 'tloc-lighttpd2.dat' using 2 w points ls 1 notitle

set title "Memcached" offset 0,-0.6
plot 'tloc-memcached.dat' using 2 w points ls 1 notitle

set title "Redis" offset 0,-0.6
plot 'tloc-redis.dat' using 2 w points ls 1 notitle

set title "Vim" offset 0,-0.6
plot 'tloc-vim.dat' using 2 w points ls 1 notitle

set title "ØMQ" offset 0,-0.6
plot 'tloc-zeromq.dat' using 2 w points ls 1 notitle
