#!/bin/bash

users=$(awk -F: '$3 > 1000 && $1 != "nobody" {print $1}' /etc/passwd)

for i in $users
do 
  if ! [[ $(last --since -30days | grep $i) ]]
    then
      sudo deluser $i
  fi
done