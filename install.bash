#!/bin/bash

mkdir -p ~/bin
if [ ! -f ~/bin/go.py ]; then
    cat bash_profile.append >> ~/.bash_profile
fi
cp ./go.py ~/bin/go.py
