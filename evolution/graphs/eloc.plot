set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,15.0cm
set output "eloc.pdf"

set multiplot layout 3,3

set xlabel ""
set ylabel "ELOC"
set xrange [0:]
set noxtics
set style line 1 lc rgb '#00B5E5' lt 1 lw 1 pt 1 ps 0.6

#filenames = "binutils git lighttpd memcached redis zeromq"
#plot for [file in filenames] file.'.dat' using 2 w points ls 1 notitle

set title "Beanstalkd" offset 0,-0.6
plot 'eloc-beanstalkd.dat' using 2 w points ls 1 notitle

set title "Binutils" offset 0,-0.6
plot 'eloc-binutils.dat' using 2 w points ls 1 notitle

set title "Git" offset 0,-0.6
plot 'eloc-git.dat' using 2 w points ls 1 notitle

set title "Lighttpd 1.4" offset 0,-0.6
plot 'eloc-lighttpd1.4.dat' using 2 w points ls 1 notitle

set title "Lighttpd 2.0" offset 0,-0.6
plot 'eloc-lighttpd2.dat' using 2 w points ls 1 notitle

set title "Memcached" offset 0,-0.6
plot 'eloc-memcached.dat' using 2 w points ls 1 notitle

set title "Redis" offset 0,-0.6
plot 'eloc-redis.dat' using 2 w points ls 1 notitle

set title "Vim" offset 0,-0.6
plot 'eloc-vim.dat' using 2 w points ls 1 notitle

set title "ØMQ" offset 0,-0.6
plot 'eloc-zeromq.dat' using 2 w points ls 1 notitle
