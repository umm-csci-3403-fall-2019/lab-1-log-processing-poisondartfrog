#!/usr/bin/env bash
SCRATCH=$(mktemp --directory)
echo $SCRATCH
for f in $*
do
    output_dir=$(basename $f "_secure.tgz")
    mkdir $SCRATCH/$output_dir
    tar -zxf "$f" --directory "$SCRATCH/$output_dir"
    SECDIR=$output_dir/var/log/
    ./process_client_logs.sh $SCRATCH/$output_dir
#   awk '/Failed/ { print > "holding.txt" }' $SCRATCH
#    for t in $SECDIR/secure*
#    do
#	
#    awk '/Failed/ { print > "holding.txt" }' $SCRATCH/$t
#    done
    
done



#rm -r $SCRATCH
