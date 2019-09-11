#!/usr/bin/env bash

SCRATCH=$(mktemp --directory)
echo $SCRATCH
for f in $@
do
    output_dir=client_logs_$(basename $f "_secure.tgz")
    mkdir $SCRATCH/$output_dir
    tar -zxf "$f" --directory "$SCRATCH/$output_dir"
done




#rm -r $SCRATCH
