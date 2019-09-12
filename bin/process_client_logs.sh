#!/usr/bin/env bash

DIR=$1

cd "$DIR" || exit
awk '/Failed/ { print > "holding.txt" }' $DIR/var/log/*
pwd


sed -En 's/([a-zA-Z0-9 ]+):...+ for ([a-zA-Z0-9_-]+) from ([0-9\.]+)...+/\1 \2 \3/p' < holding.txt > failed_login_data.txt
sed -En 's/([a-zA-Z0-9 ]+):...+ for invalid user ([a-zA-Z0-9_-]+) from ([0-9\.]+)...+/\1 \2 \3/p' < holding.txt >> failed_login_data.txt
