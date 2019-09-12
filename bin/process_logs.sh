#!/usr/bin/env bash


SCRATCH=$(mktemp --directory)

echo $SCRATCH
cd ../log_files || exit

for f in $*
do
    output_dir=$(basename $f "_secure.tgz")
    mkdir $SCRATCH/$output_dir
    tar -zxf "$f" --directory "$SCRATCH/$output_dir"
    ../bin/process_client_logs.sh $SCRATCH/$output_dir
   
done

../bin/create_username_dist.sh $SCRATCH




#rm -r $SCRATCH
