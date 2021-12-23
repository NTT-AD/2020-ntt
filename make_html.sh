#!/bin/sh

OUTPUT_DIR=$1

cat 2020NTT_redirect.txt | sed 's%https://2020.ntt/%%g' | grep -v "html " | \
while IFS=" " read FROM TO; do
	[ -d $OUTPUT_DIR/$FROM ] || mkdir -p $OUTPUT_DIR/$FROM
	cat source.html | sed "s%TO%${TO}%" > $OUTPUT_DIR/${FROM}index.html
done

cat 2020NTT_redirect.txt | sed 's%https://2020.ntt/%%g' | grep "html " | \
while IFS=" " read FROM TO; do
	[ -d `dirname $OUTPUT_DIR/$FROM` ] || mkdir -p `dirname $OUTPUT_DIR/$FROM`
	cat source.html | sed "s%TO%${TO}%" > $OUTPUT_DIR/${FROM}
done
