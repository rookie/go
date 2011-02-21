go
=============

directory organizer

This is a little script I made to save and quickly go between multiple directories

Installation
------------

dont do this if you dont know what you are doing

    bash install.bash

which is just a simple script that 

    mkdir -p ~/bin
    cp ./go.py ~/bin/go.py
    cat bash_profile.append >> ~/.bash_profile
    

Usage
-----
* list directories
    >go
    home: ~
* add directory
    >cd projects/awesome
    >go add
    >go
    home: ~
    awesome: ~/projects/awesome
* remove directory    
    >go
    home: ~
    awesome: ~/projects/awesome
    >go awesome
    >pwd
    ~/projects/awesome
    >go del awesome
    >go
    home: ~
* add directory with custom alias
    >cd ~/projects/awesome
    >go add lame
    >go
    home: ~
    lame: ~/projects/awesome
    
    
    
    
