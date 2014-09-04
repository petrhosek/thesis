set term pdfcairo enhanced color solid font 'MyriadPro,12' size 17.0cm,12.0cm
set output "patchtype.pdf"

set xtics nomirror
set grid y linetype 0 linewidth 1.000,  linetype 0 linewidth 1.000
set border 3 front linetype -1 linewidth 1.000
set key outside right top vertical Left reverse invert noenhanced autotitles nobox
set style data histogram
set style histogram rowstacked
set style fill solid 1.00 border -1
set style line 1 lt 1 lc rgb "#666666"
set style line 2 lt 1 lc rgb "#999999"
set style line 3 lt 1 lc rgb "#CCCCCC"
set style line 4 lt 1 lc rgb "#FFFFFF"

set boxwidth 0.7 relative

plot 'patchtype.dat' u 2 t "Code only" ls 1, \
                  '' u 3 t "Code+Test" ls 2, \
                  '' u 4 t "Test only" ls 3, \
                  '' u 5:xticlabels(1) t "Other" ls 4
