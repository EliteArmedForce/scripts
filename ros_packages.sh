#!/bin/bash
clear
while :
do 
    echo "#===================================================================================#"
    echo "Tasks:"
    echo "1) Create catkin_ws"
    echo "2) Delete catkin_ws"
    echo "List of Packages:"
    echo "  3) Hector Slam Packages"
    echo "      a) CV bridge"
    echo "      b) Qt instation"
    echo "  4) Rplidar"
    echo "  5) Rtabmap"
    echo "#===================================================================================#"
    printf "\n"
    read -p "Please enter your option: " ans11

    case $ans11 in

        1)
            echo "Creating catkin_ws workspace"
            mkdir -p ~/catkin_ws/src
            echo "[Set the ROS evironment]"
            echo "alias cw='~/catin_ws'" >> ~/.bashrc
            echo "alias cs='cd ~/catkin_ws/src'" >> ~/.bashrc
            echo "alias cm='cw && catkin_make'" >> ~/.bashrc
            echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
            echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
            echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc
            cd ~
            src
            sleep 10s
            cd ~/catkin_ws/src
            catkin_init_workspace
            sleep 5s
            cd ~/catkin_ws
            catkin_make
            cd ~/scripts
            echo "Done!!!"
            ;;
        2)
            echo "Delete catkin_ws"
            rm -rf ~/catkin_ws
            echo "Done!!!"
            ;;
        3)
            echo "Setting up Hector SLAM including CV_brdige & QT4"
            cs
            #melodic, 0.4.1
            git clone -b 0.4.1 https://github.com/tu-darmstadt-ros-pkg/hector_slam.git
            #melodic, 1.13.0
            git clone --branch melodic https://github.com/ros-perception/vision_opencv.git
            #qt installation
            sudo apt install -y qt4-default
            cm
            cd scripts
            sudo rm -rf ~/catkin_ws/src/rplidar_hector_slam/hector_slam/hector_mapping/launch/mapping_default.launch
            sudo rm -rf ~/catkin_ws/src/rplidar_hector_slam/hector_slam/hector_slam_launch/launch/tutorial.launch
            sudo cp ~/scripts/files/hector_slam/mapping_default.launch ~/catkin_ws/src/rplidar_hector_slam/hector_slam/hector_mapping/launch/
            sudo cp ~/scripts/files/files/hector_slam/tutorial.launch ~/catkin_ws/src/rplidar_hector_slam/hector_slam/hector_slam_launch/launch/
            echo "Done!!!"
            ;;
        4)
            echo "Setting up Rplidar including SDK"
            
            ;;
        *)
            echo wrong choice
            ;;
    esac
    echo -p "Do you want to continue (y/n): " yn
    if [[$yn = n]]; then
        break
    fi
done