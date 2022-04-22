#!/usr/bin/env bash
green='\033[0;32m'
red='\033[0;31m'
nc='\033[0m'

for ((testNum=1;;testNum++))
do
    ./$3 > input
    ./$2 < input > outSlow
    ./$1 < input > outWrong
    H1=`md5sum outWrong`
    H2=`md5sum outSlow`
    if !(cmp -s "outWrong" "outSlow")
    then
        echo -e "${red}Wrong Answer on test ${testNum}${nc}"
        echo "Input:"
        cat input
        echo "Wrong Output:"
        cat outWrong
        echo "Slow Output:"
        cat outSlow
        exit
    fi
    echo -e "Test ${testNum}: ${green}Accepted${nc}"
done

