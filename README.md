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

- *Falling squares*: A scene with stacked squares of varying sizes falling against a ground body.
- *Falling circles*: The same scene as above but with circles.
- *Tumbler*: Adds new bodies in each step inside a rotating object (See Tumbler in the Box2D testbed).
- *Add pair*: A object that moves very fast hits a big group of resting circles in a zero-gravity world.
- *mild n^2*: Spawns a number of composite objects (tables and spaceships as found in one Box2D testbed) one on top of each other, creating a degenerate simulation. Stress test for the broad-phase.
- *n^2*: A simpler version of the above. A high number of circles being on top of another, offset only by a small delta, creating an initial 'circle explosion' byu the solver.
- *Multi-fixture*: A scene that creates multiple table objects with greatly varying fixture counts.
- *Mostly static (single body)*: A huge static square made from a high number of small static square fixtures with only very few dynamic bodies that exist in a diagonal corridor inside the big box.
- *Mostly static (multi body)*: The same scene as above but all the small squares are individual bodies with a single fixture.
- *Diagonal*: A benchmark with some dynamic bodies falling through a lot of static bodies that are shaped like diagonal lines. Stress test for contact count.
- *Mixed static/dynamic*: A casual scene with both static and dynamic bodies, polygons and circles, some movement and collisions. 
- *Big mobile*: A structure resembling Box2D's 'balanced mobile' scene but much larger. A lot of joints and bodies.
- *Slow explosion*: A 'calm' scene with a high number of bodies moving slowly and without collisions in a zero gravity world.

Warning: **The absolute running time of each benchmark does not mean something on its own!**.

But, those benchmarks are useful to compare two different versions of the library, or to test how a particular change affetcs performance.

## Results
Below are plots generated from the benchmark driver.
The benchmarks where run on a AMD Ryzed 2600 CPU with 16GB 2993MHz DDR4 RAM.

[Add-pair](https://github.com/mtsamis/box2d-benchmarks/blob/master/plots/add-pair.png)

## Running

To run the benchmarks on your machine and generate the comparison plots:
```
./build.sh
./run.sh
./plot.sh
```
