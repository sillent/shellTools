#!/bin/bash

export LANG=C

GCC=`which gcc`
if [ -z $GCC ]
then
    echo -en "\"/usr/include/\" \"/usr/local/include\"\n"
    exit 0
fi

if [ -z $1 ];
then
    echo "Usage: $0 clang|header"
    exit 1
fi
#run main function

function gotIn {
    cd /tmp
    for i in `$GCC -xc . -v 2>&1|grep include|grep -A10 "#include <"|grep -v "#include"`
    do
        # echo -n "\""
        if [ $1 == "clang" ];
        then
            echo -n "\""
            echo -n "-I$i"
            echo -n "\" "
        elif [ $1 == "header" ];
        then
            echo -n "\""
            echo -n "$i"
            echo -n "\" "
        else
            echo "Not header|clang argument passed"
        fi
    done
    echo -en "\n"

}

gotIn $1
