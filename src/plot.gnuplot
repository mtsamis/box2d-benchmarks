set terminal pngcairo
set terminal png size 512,384
set output benchmark_output

set xlabel "fixture count"
set ylabel "time (ms)"

set autoscale

set title benchmark_title
set key left top
set grid

set style line 101 lw 3 lt rgb "#f62aa0"
set style line 102 lw 3 lt rgb "#26dfd0" 

plot benchmark1 using 1:2 with lines ls 101 title "Box2D", \
     benchmark2 using 1:2 with lines ls 102 title "Box2D-optimized"
