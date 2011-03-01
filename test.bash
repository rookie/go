#!/bin/bash

#if [[ "$RESULT" == GOCD* ]]; then
echo $HOME/.go
if [ "$PWD" != "$HOME/.go" ] ; then
    echo "something"
fi
