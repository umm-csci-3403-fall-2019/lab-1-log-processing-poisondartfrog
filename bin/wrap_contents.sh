#!/usr/bin/env bash

FILE_IN=$1
SPFR=$2
FILE_OUT=$3

cat "$SPFR"_header.html "$FILE_IN" "$SPFR"_footer.html > "$FILE_OUT"

