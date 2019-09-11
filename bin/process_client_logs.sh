#!/usr/bin/env bash

DIR=$1

cd "$DIR" || exit
awk '/Failed/ { print > "holding.txt" }' $DIR/var/log/*
pwd
#for f in *.tgz
#do
#	output_dir=client_logs_$(basename $f "_secure.tgz")
#	mkdir "$output_dir"
#	tar -zxf "$f" --directory "$output_dir"
#done

#for f in client_logs_*
#do
#	SECDIR=$f/var/log/
#
#	for t in secure*
#	do
#		awk '/Failed/ { print > "holding.txt" }' $SECDIR$t
#		echo $(pwd)
#	done
#
#done


sed -En 's/([a-zA-Z0-9 ]+):...+ for ([a-zA-Z0-9_-]+) from ([0-9\.]+)...+/\1 \2 \3/p' < holding.txt > failed_login_data.txt
sed -En 's/([a-zA-Z0-9 ]+):...+ for invalid user ([a-zA-Z0-9_-]+) from ([0-9\.]+)...+/\1 \2 \3/p' < holding.txt >> failed_login_data.txt
