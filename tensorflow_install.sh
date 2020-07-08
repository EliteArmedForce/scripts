echo "Tensorflow installing option:"
echo "a) Tensorflow v1.15.2 pip build"
echo "b) Tensorflow v2.1 with pip build"
echo "c) Tensorflow v1.15.0 source build"
echo "d) Tensorflow v2.0 source build"
echo "WARNING, Increase your swap file to 6GB"
read -p "Please enter your option: " ans8

    case $ans8 in
        a)
            echo "Installing Tensorflow v1.15.2 with pip"
            FILE=~/jetson_nano
            if [ -e "$FILE" ]; then
                echo "$FILE exists."
            else
                git clone https://github.com/jkjung-avt/jetson_nano.git
            fi
            cd jetson_nano
            ./install_protobuf-3.8.0.sh
            ./install_bazel-0.26.1.sh
            cd ..
            sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran -y
            sudo pip3 install -U pip testresources setuptools
            sudo apt update -y && sudo apt upgrade -y
            sudo pip3 install -U numpy==1.16.1 future==0.17.1 mock==3.0.5 h5py==2.9.0 keras_preprocessing==1.0.5 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11
            sudo pip3 install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v43 tensorflow==1.15.2
            echo "Done!!!"
            ;;
        b)
            echo "Installing Tensorflow v2.1.0 with pip build"
            FILE=~/jetson_nano
            if [ -e "$FILE" ]; then
                echo "$FILE exists."
            else
                git clone https://github.com/jkjung-avt/jetson_nano.git
            fi
            cd jetson_nano
            ./install_protobuf-3.8.0.sh
            ./install_bazel-0.26.1.sh
            cd ..
            sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran -y
            sudo pip3 install -U pip testresources setuptools
            sudo apt update -y && sudo apt upgrade -y
            sudo pip3 install -U numpy==1.16.1 future==0.17.1 mock==3.0.5 h5py==2.9.0 keras_preprocessing==1.0.5 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11
            sudo pip3 install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v43 tensorflow==2.1.0
            echo "Done!!!"
            ;;
        c)
            echo "Installing Tensorflow v1.15.0 source build"
            echo "Special thanks to JK Jung for the script"
            echo "Website: https://jkjung-avt.github.io/ & Github: https://github.com/jkjung-avt"
            FILE=~/jetson_nano
            if [ -e "$FILE" ]; then
                echo "$FILE exists."
            else
                git clone https://github.com/jkjung-avt/jetson_nano.git
            fi
            cd jetson_nano
            ./install_protobuf-3.8.0.sh
            ./install_bazel-0.26.1.sh
            ./install_tensorflow-1.15.0.sh
            cd ..
            echo "Done!!!"
            ;;
        d)
            echo "Installing Tensorflow v2.0.0 source build"
            echo "Special thanks to JK Jung for the script"
            echo "Website: https://jkjung-avt.github.io/ & Github: https://github.com/jkjung-avt"
            FILE=~/jetson_nano
            if [ -e "$FILE" ]; then
                echo "$FILE exists."
            else
                git clone https://github.com/jkjung-avt/jetson_nano.git
            fi
            cd jetson_nano
            ./install_protobuf-3.8.0.sh
            ./install_bazel-0.26.1.sh
            ./install_tensorflow-2.0.0.sh
            cd ..
            echo "Done!!!"
            ;;
        *)
            echo "Wrong choice!!!"
            ;;
    esac