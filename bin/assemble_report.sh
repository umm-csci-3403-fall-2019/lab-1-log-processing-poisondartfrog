#!/usr/bin/env bash

DIR=$1

cat $DIR/country_dist.html $DIR/hours_dist.html $DIR/username_dist.html > $DIR/fullreport.html

bin/wrap_contents.sh $DIR/fullreport.html html_components/summary_plots $DIR/failed_login_summary.html

