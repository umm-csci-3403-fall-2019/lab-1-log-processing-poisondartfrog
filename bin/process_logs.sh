#!/usr/bin/env bash

SCRATCH=$(mktemp --directory)

cd ../log_files || exit

for f in *.tgz
do
	output_dir=client_logs_$(basename $f "_secure.tgz")
	mkdir "$output_dir"
	tar -zxf "$f" --directory "$SCRATCH/$output_dir"
done




rm -r $SCRATCH
