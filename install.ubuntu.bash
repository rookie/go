#!/bin/bash

mkdir -p ~/.go
if [ ! -f ~/.go/go.py ]; then
    # tested on ubuntu linux, should work on others.
    if [ -f ~/.bashrc ]; then
        echo "append go.bash to the ~/.bashrc file"
        #copy into .bashrc
        echo "# go setup from http://www.github.com/rookie/go" >> ~/.bashrc
        echo ". ~/.go/go.bash" >> ~/.bashrc
        echo "# end go setup ####" >> ~/.bashrc
    else
        echo "cannot find ~/.bashrc file"
    fi
fi
echo "copy ./go.py to ~/.go/go.py"
cp ./go.py ~/.go/go.py
echo "copy ./go.bash to ~/.go/go.bash"
cp ./go.bash ~/.go/go.bash