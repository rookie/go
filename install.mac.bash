#!/bin/bash

mkdir -p ~/.go
if [ ! -f ~/.go/go.py ]; then
    # tested on mac osx. should work.
    if [ -f ~/.bash_profile ]; then
        echo "append go.bash to the ~/.bash_profile file"
        #copy into .bash_profile
        echo "# go setup from http://www.github.com/rookie/go" >> ~/.bash_profile
        echo ". ~/.go/go.bash" >> ~/.bash_profile
        echo "# end go setup ####" >> ~/.bash_profile
    else
        echo "append go.bash to the ~/.bash_profile file"
        #copy into .bash_profile
        echo "# go setup from http://www.github.com/rookie/go" >> ~/.bash_profile
        echo ". ~/.go/go.bash" >> ~/.bash_profile
        echo "# end go setup ####" >> ~/.bash_profile
    fi
fi
# only copy if we arent in the $HOME/.go directory
if [ "$PWD" != "$HOME/.go" ] ; then
    echo "copy ./go.py to ~/.go/go.py"
    cp ./go.py ~/.go/go.py
    echo "copy ./go.bash to ~/.go/go.bash"
    cp ./go.bash ~/.go/go.bash
fi