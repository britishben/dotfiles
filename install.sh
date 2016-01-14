#!/bin/bash

file=$1
currentdir=`pwd`

ln -sfv "$currentdir/$file" ~/$file
