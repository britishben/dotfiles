#!/bin/bash
#basic install script - pass the file to install as param, and it gets installed in ~.
#now handles special case of tma completion.

file=$1
currentdir=`pwd`

if [ $1 != "tma" ]; then
    ln -sfv "$currentdir/$file" ~/$file
else
    ln -sfv "/etc/bash_completion.d/tma"
fi
