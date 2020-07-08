#!/bin/bash

cd ~
echo "Exporting to Bashrc"
echo "alias rc='sudo nano ~/.bashrc && source ~/.bashrc" >> ~/.bashrc
echo "alias sc='source ~/.bashrc" >> ~/.bashrc
echo "alias grc='sudo gedit ~/.bashrc && source ~/.bashrc" >> ~/.bashrc
echo "alias vsc='code-oss" >> ~/.bashrc
echo "alias vrc='sudo vsc ~/.bashrc && source ~/.bashrc" >> ~/.bashrc
echo "alias rc='sudo nano ~/.bashrc && source ~/.bashrc" >> ~/.bashrc
echo "Done!!!"