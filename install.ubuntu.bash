#!/bin/bash

mkdir -p ~/bin
if [ ! -f ~/bin/go.py ]; then
    # tested on ubuntu linux, should work on others.
    if [ -f ~/.bashrc ]; then
        echo "append ./bash_profile.append to the ~/.bashrc file"
        cat bash_profile.append >> ~/.bash_profile
    else
        echo "cannot find ~/.bashrc file"
    fi
fi
echo "copy ./go.py to ~/bin/go.py"
cp ./go.py ~/bin/go.py
