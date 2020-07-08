#!/bin/bash

cd ~
echo "Exporting to Bashrc"
echo "alias rc='sudo nano ~/.bashrc && source ~/.bashrc" >> ~/.bashrc
echo "alias src='source ~/.bashrc" >> ~/.bashrc
echo "alias grc='sudo gedit ~/.bashrc && source ~/.bashrc" >> ~/.bashrc
echo "alias vsc='code-oss" >> ~/.bashrc
echo "Done!!!"