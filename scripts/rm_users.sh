#!/bin/bash

users=("kaylee" "lilie" "connor" "chris" "danielle")
cd /home

for user in ${users[@]}; do
   userdel $user
   rm -r $user
done
