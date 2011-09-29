#!/bin/bash

#### go App ####
# go app setup from http://www.github.com/rookie/go
# 1. main command 'go'
function go()
{
    RESULT=$(python ~/.go/go.py $*)
    
    if [[ "$RESULT" == GOCD* ]]; then
        if [ -d "${RESULT:5}" ]; then
            cd "${RESULT:5}"
            pwd
        fi
    else
        echo "${RESULT}"
    fi
}
# 2. setup for bash auto completion
# http://www.debian-administration.org/article/An_introduction_to_bash_completion_part_2
_go() 
{
    local cur prev opts
    COMPREPLY=()
    if [[ $COMP_CWORD == 1 ]] ; then
        prev="${COMP_WORDS[COMP_CWORD-1]}"
        cur="${COMP_WORDS[COMP_CWORD]}"
        RESULT=$(python ~/.go/go.py complete)
        opts="$RESULT"
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
}
# 3. register function with complete command
complete -F _go go
#### end go App ####
