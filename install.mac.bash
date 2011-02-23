#!/bin/bash

mkdir -p ~/bin
if [ ! -f ~/bin/go.py ]; then
    # tested on mac osx. should work.
    if [ -f ~/.bash_profile ]; then
        echo "append ./bash_profile.append to the ~/.bash_profile file"
        cat bash_profile.append >> ~/.bash_profile
    else
        echo "append ./bash_profile.append to the ~/.bash_profile file"
        cat bash_profile.append >> ~/.bash_profile
    fi
fi
echo "copy ./go.py to ~/bin/go.py"
cp ./go.py ~/bin/go.py
