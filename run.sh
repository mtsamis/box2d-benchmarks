#!/usr/bin/env bash

cd build

echo "Box2D benchmark driver program (Single threaded)"
echo "In order to improve the accuraccy of the results please close all other running programs and provide consistent cooling."
echo ""

echo "==== Box2D ===="
echo "Running box2d_single for warmup"

./box2d_single

echo "Running box2d_full benchmark suite. This will take a while"

./box2d_full

echo "==== Box2D-optimized ===="
echo "Running box2d_optimized_single for warmup"
./box2d_optimized_single

echo "Running box2d_optimized_full benchmark suite. This will take a while"

./box2d_optimized_full
