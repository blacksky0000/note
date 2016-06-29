#!/bin/bash

platfrom="unknown"
os=$(echo $OSTYPE | sed "s/[^a-z]//g")

if [[ $os == "darwin" ]]; then
	platfrom="OS X"

elif [[ $os == "linux" ]]; then
	platfrom="linux"
fi
