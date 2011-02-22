#!/bin/bash

mkdir -p ~/bin
if [ ! -f ~/bin/go.py ]; then
    # priority of bash files from
    # http://www.comptechdoc.org/os/linux/howlinuxworks/linux_hlbash.html
    if [ -f ~/.bash_profile ]; then
        echo "append ./bash_profile.append to the ~/.bash_profile file"
        cat bash_profile.append >> ~/.bash_profile
    elif [ -f ~/.bash_login ]; then
        echo "append ./bash_profile.append to the ~/.bash_login file"
        cat bash_profile.append >> ~/.bash_login
    elif [ -f ~/.profile ]; then
        echo "append ./bash_profile.append to the ~/.profile file"
        cat bash_profile.append >> ~/.profile
    else
        echo "append ./bash_profile.append to the ~/.bash_profile file"
        cat bash_profile.append >> ~/.bash_profile
    fi
fi
echo "copy ./go.py to ~/bin/go.py"
cp ./go.py ~/bin/go.py
