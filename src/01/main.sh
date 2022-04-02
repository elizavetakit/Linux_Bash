#!/bin/bash

re='^[+-]?[0-9]+([.][0-9]+)?$'

if [ $# != 1 ]
        then
                echo "error: incorrect input"
                exit 1
fi

if [[ $1 =~ $re ]]
        then
                echo "error: incorrect input"
                exit 1
fi

if [ $# -gt 0 ]
        then
                echo $1
else
        echo "error: incorrect input"
fi