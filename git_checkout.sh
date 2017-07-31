#!/bin/bash

branch_count=`git branch | wc -l`

if [ "$1" = "" ]; then
    echo Branch numbers and name
    paste <(echo $branch_count | xargs seq) <(git branch)
    echo -n "Input the branch number to checkout: "
    read branch_num
else
    branch_num=$1
fi

if [ ! "$(echo $branch_num | grep "^[ [:digit:] ]*$")" ]; then
    echo Input has to be number.
    exit 1
elif [ $branch_num -le 0 -o $branch_num -gt $branch_count ]; then
    echo Wrong input.
    exit 1
fi

branch_name=`git branch | sed -e "s/[\* ]*//g" | sed "$branch_num"'!d'`
git checkout $branch_name

