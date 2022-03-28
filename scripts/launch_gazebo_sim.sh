#!/bin/bash

echo "Launching Multiagent Simulation"
cd /home/hussein/px4/PX4-Autopilot/
pwd
git submodule update --init --recursive
DONT_RUN=1 make px4_sitl_rtps gazebo
./Tools/gazebo_sitl_multiple_run.sh -n 2 -s plane:1,boat:1 -t px4_sitl_rtps -w boat_2
# ./Tools/gazebo_sitl_multiple_run.sh -n 2 -s iris:1,iris:1 -t px4_sitl_rtps

echo "Done"