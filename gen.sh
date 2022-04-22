#!/usr/bin/env bash
# gentest.sh <solution> <generator> <no. tests> <prefix>
# prefix: main, pretest, strong, sample, ...
# please make sure the solution is totally correct
green='\033[0;32m'
red='\033[0;31m'
nc='\033[0m'

sol=$1
gen=$2
testTotal=$3
prefix=""
if [[ $5 ]];
  then
    prefix=$5
fi
if [[ ! -d "test" ]];
    then
        mkdir test
fi

for ((testNum=$3;testNum<$4+1;testNum++))
do
    ./$gen > test/$prefix$testNum.in
    ./$sol < test/$prefix$testNum.in > test/$prefix$testNum.out
    echo -e "${green}Test #${testNum} generated${nc}!"
done
echo -e "${green}Generated ${testTotal} ${prefix} tests${nc}"




