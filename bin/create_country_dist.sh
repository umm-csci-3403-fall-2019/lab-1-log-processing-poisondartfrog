#!/usr/bin/env bash

DIR=$1

for f in $(find "$DIR" -name failed_login_data.txt)
do

    sed -En 's/...+ ([[:digit:]\.]+)/\1/p'< "$f" >> "$DIR/onlyip.txt"
done

sort < "$DIR/onlyip.txt" > "$DIR/sortedip.txt"
join "$DIR/sortedip.txt" "etc/country_IP_map.txt" > "$DIR/countrycode.txt"
sed -E 's/.+ ([A-Z]+)/\1/g' "$DIR/countrycode.txt" \
   | sort \
   | uniq -c \
   > "$DIR/uniqsortcc.txt"


sed -E 's/[ ]+ (.+) ([A-Z]+)/data.addRow([\x27\2\x27, \1]);/' < "$DIR/uniqsortcc.txt" > "$DIR/datalistcc.txt"

bin/wrap_contents.sh "$DIR/datalistcc.txt" "html_components/country_dist" "$DIR/country_dist.html"



