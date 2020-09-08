#!/usr/bin/env bash

rm -rf build

cd src

cd box2d
rm -rf build
mkdir build
cd build
cmake -G'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release -DBOX2D_BUILD_BENCHMARK=ON -DBOX2D_BUILD_UNIT_TESTS=OFF -DBOX2D_BUILD_TESTBED=OFF -DBOX2D_BUILD_DOCS=OFF ..
make -j

cd ../../box2d-optimized
rm -rf build
mkdir build
cd build
cmake -G'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release -DBOX2D_BUILD_BENCHMARK=ON -DBOX2D_BUILD_UNIT_TESTS=OFF -DBOX2D_BUILD_TESTBED=OFF -DBOX2D_BUILD_DOCS=OFF ..
make -j

cd ../../..

mkdir build

cp src/box2d/build/benchmark_single build/box2d_single
cp src/box2d/build/benchmark_full build/box2d_full

cp src/box2d-optimized/build/benchmark_single build/box2d_optimized_single
cp src/box2d-optimized/build/benchmark_full build/box2d_optimized_full
