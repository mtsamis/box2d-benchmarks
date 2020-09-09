#!/usr/bin/env bash

cp src/plot.gnuplot build/
cd build

for f in `find -name "*box2d.csv"`; do
  NAME=`echo "$f" | sed "s/.\/\(.*\)-box2d.csv/\1/"`
  gnuplot -e "benchmark_output='${NAME}.png'; benchmark_title='${NAME}'; benchmark1='${NAME}-box2d.csv'; benchmark2='${NAME}-opt.csv'" -p plot.gnuplot
done
