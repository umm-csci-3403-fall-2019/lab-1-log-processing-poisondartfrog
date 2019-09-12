#!/usr/bin/env bash

DIR=$1

for f in $(find $DIR -name failed_login_data.txt)
do
    sed -En 's/[a-zA-Z ]+[0-9 ]+[ 0-9]+[a-z-A-Z0-9-_]+( \d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/\1/p'< $f >> $$DIR/
    

