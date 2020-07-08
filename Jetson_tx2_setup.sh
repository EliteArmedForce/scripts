#!/bin/bash

#clear
while :
do 
    echo "#=====================================================#"
    echo "List of Packages/Tasks:"
    echo "1) Setting up SSD"
    echo "**********NOTE: PLEASE UPDATE after 1********"
    echo "2) Setting up bashrc"
    echo "3) Installing NoMachine arm64"
    echo "4) Installing Visual Studio Code"
    echo "5) Resize swap to 6GB"
    echo "6) Resize back to default (4GB)"
    echo "7) Install OpenCV v3.4.8"
    echo "8) Install Tensorflow"
    echo "9) Installing YOLOv3"
    echo "10) Installing ROS Melodic"
    echo "11) Installing ROS Packages"
    echo "12) Installing ZED SDK (check ros, zed-ros-wrapper)"
    echo "99) Tester"
    echo "#=====================================================#"
    echo "Press <CTRL+C> to exit."
    printf "\n"
    echo -e "Please enter the your option to be installed: \c"
    read pack

    case $pack in

        1)
            echo -p "Please enter your SSD name: " SSDNAME
            sudo cp -ax / /media/$SSDNAME && sync
            sudo cp /boot/extlinux/extlinux.conf /boot/extlinux/extlinux.conf.original
            rm -rf /boot/extlinux/extlinux.conf
            sudo cp ~/scripts/files/extlinux/extlinux.conf /boot/extlinux/
            echo "Rebooting in 5s"
            sleep 5
            sudo reboot
            echo "Done!!!"
            ;;
        2)
            chmod +x bashrc_addons.sh
            ./bashrc_addons
            ;;
        3)
            echo "Installing NoMachine arm64"
            wget https://download.nomachine.com/download/6.10/Arm/nomachine_6.10.12_1_arm64.deb
            sudo dpkg -i ~/Downloads/nomachine_6.9.2_1_arm64.deb
            echo "Done!!!"
            ;;
        4)
            echo "Installing Visual Studio Code"
            echo "Special thanks to Mr. Jim from JetsonHack for the script"
            echo "Youtube: https://www.youtube.com/c/JetsonHacks & Github: https://github.com/jetsonhacks"
            git clone https://github.com/JetsonHacksNano/installVSCode.git
            cd installVSCode
            ./installVSCode.sh
            cd ..
            echo "Done!!!"
            ;;
        5)
            echo "Resizing to swap to 6GB"
            echo "Special thanks to Mr. Jim from JetsonHack for the script"
            echo "Youtube: https://www.youtube.com/c/JetsonHacks & Github: https://github.com/jetsonhacks"
            sudo cp /etc/systemd/nvzramconfig.sh /etc/systemd/nvzramconfig.sh.original
            git clone https://github.com/JetsonHacksNano/resizeSwapMemory.git
            cd resizeSwapMemory
            ./setSwapMemorySize -g 6
            cd ..
            echo "Rebooting in 5s !!!!!!!!!!"
            sleep 5
            sudo reboot
            echo "Done!!!"
            ;;
        6)
            echo "Resize swap to default"
            sudo rm -rf /etc/systemd/nvzramconfig.sh
            sudo mv /etc/systemd/nvzramconfig.sh.original /etc/systemd/nvzramconfig.sh
            echo "Rebooting in 5s !!!!!!!!!!"
            sleep 5
            sudo reboot
            echo "Done!!!"
            ;;
        7)
            "Installing OpenCV v3.4.8"
            echo "WARNING, Please increase your swap file to 6GB"
            git clone https://github.com/jkjung-avt/jetson_nano.git
            cd jetson_nano
            ./install_opencv-3.4.8.sh
            cd ..
            echo "Done!!!"
            ;;
        8)
            ./tensorflow_install.sh
            ;;
        9)
            echo "Installing Yolov3"
            git clone https://github.com/pjreddie/darknet yolov3
            cd yolov3
            wget https://pjreddie.com/media/files/yolov3.weights
            rm -rf cfg/yolov3.cfg
            rm -rf Makefile
            cp ~/scripts/files/yolov3/yolov3.cfg ~/scripts/yolov3/cfg
            cp ~/scripts/files/yolov3/Makefile ~/scripts/yolov3/
            make
            cd ..
            echo "Done!!!"
            ;;
        10)
            echo "Installing ROS"
            ./installROS.sh
            ;;
        11)
            ./ros_packages.sh
            ;;
        *)
            echo wrong choice
            ;;
    esac
    echo "Press <CTRL+C> to exit."
    sleep 5s
done