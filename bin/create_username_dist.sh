#!/usr/bin/env bash

DIR=$1

for f in $(find $DIR -name failed_login_data.txt)
do


	sed -En 's/[a-zA-Z ]+[0-9 ]+[ 0-9]+([a-zA-Z0-9\-_]+)...+/\1/p' < $f >> $DIR/only_usrs.txt
	
done


sort < $DIR/only_usrs.txt > $DIR/sorted.txt
uniq -c < $DIR/sorted.txt > $DIR/uniqsort.txt
	
sed -E 's/([0-9]+) ([a-zA-Z0-9_\-]+)/data.addRow([\x27\2\x27, \1]);/' < $DIR/uniqsort.txt >> $DIR/datalist.txt
	
./bin/wrap_contents.sh $DIR/datalist.txt html_components/username_dist $DIR/username_dist.html
