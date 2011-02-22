go
=============

directory bookmark organizer

This is a script to save and quickly cd between multiple directories

Installation
------------

dont do this if you dont know what you are doing. take a look at install.bash

    bash install.bash

which is just a simple script that

    mkdir -p ~/bin
    cp ./go.py ~/bin/go.py
    cat bash_profile.append >> ~/.bash_profile
    

Usage
-----
* list directories
        $go
        home: ~
* add directory
        $cd projects/awesome
        $go add
        $go
        home: ~
        awesome: ~/projects/awesome
* go to directory
        $go
        home: ~
        awesome: ~/projects/awesome
        $go awesome
        $pwd
        ~/projects/awesome
* remove alias
        $go
        home: ~
        awesome: ~/projects/awesome
        $go del awesome
        $go
        home: ~
* remove directory
        $go
        home: ~
        awesome: ~/projects/awesome
        $go awesome
        $pwd
        ~/projects/awesome
        $go del
        $go
        home: ~
* add directory with custom alias
        $cd ~/projects/awesome
        $go add lame
        $go
        home: ~
        lame: ~/projects/awesome

    
    
    
