set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,12.0cm
set output "patchcoverage.pdf"

set grid layerdefault linetype 0 linewidth 1.0, linetype 0 linewidth 1.0
set border 3 front linetype -1 linewidth 1.0
set key outside right top vertical Left reverse invert noenhanced autotitles nobox

set style data histogram
set style histogram rowstacked
set style fill solid 1.00 border -1

set style line 1 lt 1 lc rgb "#DDDDDD"
set style line 2 lt 1 lc rgb "#BBBBBB"
set style line 3 lt 1 lc rgb "#999999"
set style line 4 lt 1 lc rgb "#777777"
set style line 5 lt 1 lc rgb "#FFFFFF"

set boxwidth 0.7 relative

plot 'patchcoverage.dat' u 2 t "0%" ls 5, \
                      '' u 3 t "(0%,     25%]" ls 1, \
                      '' u 4 t "(25%,   50%]" ls 2, \
                      '' u 5 t "(50%,   75%]" ls 3, \
                      '' u 6:xticlabels(1) t "(75%, 100%]" ls 4
