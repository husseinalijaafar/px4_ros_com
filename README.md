# Modifications
This fork is for personal development of PX4 for some multi-agent experimentation. 
Main changes are the addition of two examples, `offboard_control_multi_boat.cpp` and `offboard_control_multi_boat.cpp`.
I also added the world file. 

To install the worlds and models, copy contents from `worlds_and_models` to
`/px4/PX4-Autopilot/Tools/sitl_gazebo/worlds` or `/px4/PX4-Autopilot/Tools/sitl_gazebo/models` 

To run (make sure installed correctly, see details at end).
`source ./install/setup.bash` 

Terminal 1: 
```
cd ~/px4/PX4-Autopilot/

git submodule update --init --recursive
DONT_RUN=1 make px4_sitl_rtps gazebo
./Tools/gazebo_sitl_multiple_run.sh -n 2 -s plane:1,boat:1 -t px4_sitl_rtps -w boat_2
```

Terminal 2: (px4_ros_com_ros2 is the colcon workspace), with src/px4_ros_com and src/px4_msgs
```
cd ~/px4_ros_com_ros2
source ./install/setup.bash
micrortps_agent -t UDP -r 2020 -s 2019 -n vhcl0 & micrortps_agent -t UDP -r 2022 -s 2021 -n vhcl1 &
```

Terminal 3:
```
cd ~/px4_ros_com_ros2
source ./install/setup.bash
ros2 run px4_ros_com offboard_control_multi_boat 
```
Or to control the plane
Terminal 4:
```
cd ~/px4_ros_com_ros2
source ./install/setup.bash
ros2 run px4_ros_com offboard_control_multi_plane 
```


# PX4-ROS2 bridge

[![GitHub license](https://img.shields.io/github/license/PX4/px4_ros_com.svg)](https://github.com/PX4/px4_ros_com/blob/master/LICENSE) [![GitHub (pre-)release](https://img.shields.io/github/release-pre/PX4/px4_ros_com.svg)](https://github.com/PX4/px4_ros_com/releases/tag/beta) [![DOI](https://zenodo.org/badge/142936318.svg)](https://zenodo.org/badge/latestdoi/142936318) [![Build and Test package](https://github.com/PX4/px4_ros_com/workflows/Build%20and%20Test%20package/badge.svg?branch=master)](https://github.com/PX4/px4_ros_com/actions)

This package materializes the ROS2 side of PX4-FastRTPS/DDS bridge, establishing a bridge between the PX4 autopilot stack through a micro-RTPS bridge, Fast-RTPS(DDS) and ROS2. It has a straight dependency on the [`px4_msgs`](https://github.com/PX4/px4_msgs) package, as it depends on the IDL files, to generate the micro-RTPS bridge agent, and on the ROS interfaces and typesupport, to allow building and running the example nodes.

The [`master`](https://github.com/PX4/px4_ros_com/tree/master) branch of this package composes the ROS2 package and the ROS2 side (agent) of the bridge. The [`ros1`](https://github.com/PX4/px4_ros_com/tree/ros1) branch is a product of the `master` and represents the ROS(1) package and the ROS(1) side of the bridge, for wich it is required using the [`ros1_bridge`](https://github.com/ros2/ros1_bridge).

## Install, build and usage

Check the [RTPS/ROS2 Interface](https://dev.px4.io/en/middleware/micrortps.html) section on the PX4 Devguide for details on how to install the required dependencies, build the package (composed by the two branches) and use it.

## Bug tracking and feature requests

Use the [Issues](https://github.com/PX4/px4_ros_com/issues) section to create a new issue. Report your issue or feature request [here](https://github.com/PX4/px4_ros_com/issues/new).

## Questions and troubleshooting

Reach the PX4 development team on the `#messaging` or `#ros` PX4 Slack channels:
[![Slack](https://px4-slack.herokuapp.com/badge.svg)](http://slack.px4.io)
