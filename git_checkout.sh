#!/bin/bash
echo Branch numbers and name
paste <(git branch | wc -l | xargs seq) <(git branch)
echo -n "Input the branch number to checkout: "
read branch_num

git branch | sed -e "s/[\* ]*//g" | sed "$branch_num"'!d' | git checkout

