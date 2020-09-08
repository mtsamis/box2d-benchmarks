# Box2D-benchmarks
This repository contains a collection of benchmarks for Box2D.

It is used to measure and compare the performance between [box2d](https://github.com/erincatto/box2d) and my optimized fork [box2d-optimized](https://github.com/mtsamis/box2d-optimized).

There are currenly 13 benchmark scenes. Each scene has a size parameter that affects how many fixtures/bodies will be generated in some way.
The `single` benchmark executable runs each scene in a specific size configuration and outputs the total runtime and the max step time for each benchmark scene.
Run this benchmark to have a fast look at the runtime of each scene in both libraries.

The `full` benchmark executable runs each scene multiple times in an increasing size configuration and outputs the total running time for each size configuration.
Run this to compare how the libraries scale as the fixture/body count increases, and in order to generate the comparison plots. (Warning: very slow. Expect 30-60 minutes)

Each benchmark scene is run for a fixed amount of steps, with fixed time-steps in order to have reproducible results.

## Benchmark scenes
Bellow are descriptions of the current 13 scenes and their setup:

- *Falling squares*: A scene with a number of stacked squares of unequal size falling against a ground body. Dedicated to test handling of fixtures with great variety of size and size ration, high number of collisions and contacts.
- *Falling circles*: The same scene but with circles. Used to compare the performance characteristics of circles against polygons throughout the pipeline.
- *Tumbler*: A Box2D-inspired benchmark. Used to test dynamic body creation, ie adding bodies in each step.
- *Add pair*: Another Box2D-inspired benchmark. A object that moves very fast hits a big group of resting bodies in a zero-gravity world. This is a stress test as a very high number of collisions and contacts will suddenly be created and last for a few number of frames.
- *mild n^2*: A degenarate scene. This benchmark creates a number of composite objects (tables and spaceships as found in one Box2D demo scene) and adds a lot of copies at the same point. This creates $O(n^2)$ contact pairs momentarily and is designed to explore worst-case performance.
- *n^2*: A simpler version of the above. A high number of single-shape bodies being on top of another, offset only by a small delta, creating a 'circle explosion' initially
- *Multi-fixture*: A scene that tests bodies with greatly varying fixture count. Same size tables are created each built with more and smaller (non-overlapping) fixtures. Those tables are thrown into a U shapped static object.
- *Mostly static (single body)*: A huge static square made from a very high number of small static squares where only very few dynamic bodies exist in a diagonal corridor inside the big box. Used to test worlds with very high number of static / dynamic body ratios. All the small squares are individual fixtures in a signle body. 
- *Mostly static (multi body)*: The same scene as above but all the small squares are individual bodies with a single fixture.
- *Diagonal*: A benchmark with some dynamic bodies falling through a lot of static bodies that are shaped like diagonal lines, hence having the worse AABB bounding-box approximation possible. This creates very much broadphase pairs but with few real collisions.
- *Mixed static/dynamic*: A casual scene with both static and dynamic bodies, polygons and circles, some movement and collisions. 
- *Big mobile*: Another Box2D-inspired benchmark. A structure resembling Box2D's 'balanced mobile' scene but much larger. Features a lot bodies and joints in a very wide structure slowly doing a flip.
- *Slow explosion*: A scene with a high number of bodies moving slowly and without collisions in a zero gravity world. Used to test performance in 'calm' scenes.

Warning: **The absolute running time of each benchmark does not mean something on its own!**.

But, those benchmarks are useful to compare two different versions of the library, or to test how a particular change affetcs performance.

## Results
Below are plots generated from the benchmark driver.
The benchmarks where run on a AMD Ryzed 2600 CPU with 16GB 2993MHz DDR4 RAM.

## Running

To run the benchmarks on your machine and generate the comparison plots:
```
./build.sh
./run.sh
./plot.sh
```
