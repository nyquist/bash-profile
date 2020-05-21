#!/bin/bash

BASHRC=~/.bashrc
LINE="source `pwd`/.bashrc"
grep -qxF "$LINE" $BASHRC || echo $LINE >> $BASHRC
source $BASHRC
