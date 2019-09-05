#!/usr/bin/env bash

DIR=$1

cd "$DIR" || exit


for f in *.tgz
do
	output_dir=client_logs_$(basename $f "_secure.tgz")
	mkdir "$output_dir"
	tar -zxf "$f" --directory "$output_dir"
done


#sed -en 's/


