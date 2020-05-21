#!/bin/bash

## Detect os type
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux
                BASHRC=~/.bashrc
                ;;
    Darwin*)    machine=Mac
                BASHRC=~/.bash_profile
                ;;
    CYGWIN*)    machine=Cygwin
                BASHRC=~/.bashrc
                ;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac


LINE="source `pwd`/.bashrc"
grep -qxF "$LINE" $BASHRC || echo $LINE >> $BASHRC
source $BASHRC
echo "Appended to $BASHRC"
