go
=============

directory bookmark organizer

This is a script to save and quickly cd between multiple directories

Installation
------------

dont do this if you dont know what you are doing. take a look at install.bash

mac

    . install.mac.bash

ubuntu (should work on other linux but has not been tested)

    . install.ubuntu.bash

which is just a simple script that

* appends loading of the .go/go.bash file to your terminal startup
* copy over the go.bash bash file for changing directories and auto complete
* copy over the main go.py application

installed files

    .go.json (settings file)
    .go/
        go.bash (register go command, register for auto completion)
        go.py
    

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

Default ~/.go.json config file
----------------------------

    {
        "info": {
            "name": "go settings file",
            "version": 1,
            "website": "www.github.com/rookie/go"
        },
        "paths": {
            "home": "~",
        }
    }

Example ~/.go.json config file
----------------------------

    {
        "info": {
            "name": "go settings file",
            "version": 1,
            "website": "www.github.com/rookie/go"
        },
        "paths": {
            "arduino": "~/Documents/Arduino",
            "github": "~/Github",
            "dropbox": "~/Dropbox",
            "home": "~",
            "python": "~/Projects/python",
            "websites": "~/Sites"
        }
    }
