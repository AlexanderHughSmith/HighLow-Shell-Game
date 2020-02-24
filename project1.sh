#!/bin/sh
#Written by Alexander Smith on 2/21/2020

if [ -z "$1" ]
  then
    echo "Please provide a maximum number argument"
    echo Example: '"./project1.sh 75"'
    exit 0
fi

echo 
echo Hello $1 thats