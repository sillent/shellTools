#!/bin/bash

export LANG=C

GCC=`which gcc`
cd /tmp
for i in `$GCC -xc . -v 2>&1|grep include|grep -A10 "#include <"|grep -v "#include"`
do
    echo -n "\""
    echo -n "$i"
    echo -n "\" "
done
echo -en "\n"
