#!/usr/bin/env bash

DIR=$1

for f in $(find $DIR -name failed_login_data.txt)
do

    sed -En 's/...+ ([[:digit:]\.]+)/\1/p'< $f >> $DIR/onlyip.txt
done




#...+ (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})


#[a-zA-Z ]+[0-9 ]+[a-z-A-Z0-9-_ ]+( \d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})
