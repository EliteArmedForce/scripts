#!/bin/bash
# Apache License 2.0
# Copyright (c) 2017, ROBOTIS CO., LTD.


#------------------------------------------------------------
# Run command
# chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
#------------------------------------------------------------

#------------------------------ROS Installation_Melodic---------------------------------------------------

echo "ROS Installation Process for Melodic"

echo "Setting up PC to accept ROS source files"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
echo "Done setting PC"

echo "Setting up Keys"
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

echo "Update && Upgrade"
sudo apt-get update && sudo apt-get upgrade

echo "ROS Desktop FUll install"
sudo apt install ros-melodic-desktop-full

echo "Initialize rosdep"
sudo rosdep init
rosdep update

echo "Environment Setup"
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "Installing dependencies package"
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential

echo "Setting up catkin_workspace"
mkdir ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws
catkin_make

echo "[Set the ROS evironment]"
sh -c "echo \"alias eb='nano ~/.bashrc'\" >> ~/.bashrc"
sh -c "echo \"alias sb='source ~/.bashrc'\" >> ~/.bashrc"
sh -c "echo \"alias gs='git status'\" >> ~/.bashrc"
sh -c "echo \"alias gp='git pull'\" >> ~/.bashrc"
sh -c "echo \"alias cw='cd ~/catkin_ws'\" >> ~/.bashrc"
sh -c "echo \"alias cs='cd ~/catkin_ws/src'\" >> ~/.bashrc"
sh -c "echo \"alias cm='cd ~/catkin_ws && catkin_make'\" >> ~/.bashrc"
sh -c "echo \"source /opt/ros/melodic/setup.bash\" >> ~/.bashrc"
sh -c "echo \"source ~/catkin_ws/devel/setup.bash\" >> ~/.bashrc"

sh -c "echo \"export ROS_MASTER_URI=http://localhost:11311\" >> ~/.bashrc"
sh -c "echo \"export ROS_HOSTNAME=localhost\" >> ~/.bashrc"

cd ~
source .bashrc

echo "Installation of ROS and ROS Catkin workspace is complete"
echo "Have a Good Day!!!!! :)"
echo"               @@@@@@@@@@@@@@@@@@@@@@@@@@
                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
               @@@@@@@@@@    @@@@@@@@    @@@@@@@@@
              @@@@@@@@@@@    @@@@@@@@    @@@@@@@@@@
             @@@@@@@@@@@@    @@@@@@@@    @@@@@@@@@@@
             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
             @@@@@@@@@@   @@@@@@@@@@@@@@   @@@@@@@@@
             @@@@@@@@@@    @@@@@@@@@@@@    @@@@@@@@@
             @@@@@@@@@@@    @@@@@@@@@@    @@@@@@@@@@
              @@@@@@@@@@@@    @@@@@@@    @@@@@@@@@@@
               @@@@@@@@@@@@            @@@@@@@@@@@@@
                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

#Refernce multiline emotes: https://codegolf.stackexchange.com/questions/16587/print-a-smiley-face/16727
#https://twistedsifter.com/2015/06/best-text-emoticons-on-a-single-page/

#-------------------------------END--------------------------------------------------