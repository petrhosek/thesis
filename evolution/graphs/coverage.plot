set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,15.0cm
set output "coverage.pdf"

set multiplot layout 3,3

set ylabel "Coverage"
set xrange [0:]
set yrange [0:100]
set noxtics
set key left top

set style line 1 lc rgb '#00B5E5' lt 1 lw 1 pt 1 ps 0.5
set style line 2 lc rgb '#CB2027' lt 2 lw 1 pt 2 ps 0.5
set style line 3 lc rgb '#00B5E5' lt 1 lw 1.5 pt 1 ps 1
set style line 4 lc rgb '#CB2027' lt 2 lw 1.5 pt 2 ps 1

set title "Beanstalkd" offset 0,-0.6
plot 'coverage-beanstalkd.dat' using 2 notitle w points ls 1, \
                            '' using 3 notitle w points ls 2, \
                            -1 t "Line cov" w points ls 3, \
                            -1 t "Branch cov" w points ls 4

set title "Binutils" offset 0,-0.6
plot 'coverage-binutils.dat' using 2 notitle w points ls 1, \
                          '' using 3 notitle w points ls 2, \
                          -1 t "Line cov" w points ls 3, \
                          -1 t "Branch cov" w points ls 4

set title "Git" offset 0,-0.6
plot 'coverage-git.dat' using 2 notitle w points ls 1, \
                     '' using 3 notitle w points ls 2, \
                     -1 t "Line cov" w points ls 3, \
                     -1 t "Branch cov" w points ls 4

set title "Lighttpd 1.4" offset 0,-0.6
plot 'coverage-lighttpd1.4.dat' using 2 notitle w points ls 1, \
                             '' using 3 notitle w points ls 2, \
                             -1 t "Line cov" w points ls 3, \
                             -1 t "Branch cov" w points ls 4

set title "Lighttpd 2.0" offset 0,-0.6
plot 'coverage-lighttpd2.dat' using 2 notitle w points ls 1, \
                           '' using 3 notitle w points ls 2, \
                           -1 t "Line cov" w points ls 3, \
                           -1 t "Branch cov" w points ls 4

set title "Memcached" offset 0,-0.6
plot 'coverage-memcached.dat' using 2 notitle w points ls 1, \
                           '' using 3 notitle w points ls 2, \
                           -1 t "Line cov" w points ls 3, \
                           -1 t "Branch cov" w points ls 4

set title "Redis" offset 0,-0.6
plot 'coverage-redis.dat' using 2 notitle w points ls 1, \
                       '' using 3 notitle w points ls 2, \
                       -1 t "Line cov" w points ls 3, \
                       -1 t "Branch cov" w points ls 4

set title "Vim" offset 0,-0.6
plot 'coverage-vim.dat' using 2 notitle w points ls 1, \
                     '' using 3 notitle w points ls 2, \
                     -1 t "Line cov" w points ls 3, \
                     -1 t "Branch cov" w points ls 4

set title "ØMQ" offset 0,-0.6
plot 'coverage-zeromq.dat' using 2 notitle w points ls 1, \
                        '' using 3 notitle w points ls 2, \
                        -1 t "Line cov" w points ls 3, \
                        -1 t "Branch cov" w points ls 4
