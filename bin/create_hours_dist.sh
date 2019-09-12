#!/usr/bin/env bash

DIR=$1

for f in $(find $DIR -name failed_login_data.txt)
do
	sed -E 's/[a-zA-Z ]+[0-9]+ ([0-9]+)...+/\1/' < $f >> $DIR/only_hrs.txt
done

sort <$DIR/only_hrs.txt > $DIR/sortedhrs.txt
uniq -c < $DIR/sortedhrs.txt > $DIR/uniqsorthrs.txt

sed -E 's/[ ]+([0-9]+) ([0-9]+)/data.addRow([\x27\2\x27, \1]);/' < $DIR/uniqsorthrs.txt > $DIR/datalisthrs.txt

../bin/wrap_contents.sh $DIR/datalisthrs.txt ../html_components/hours_dist $DIR/hours_dist.html
