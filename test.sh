#!/bin/sh

while IFS=" " read from to; do
echo $from "---->" `curl -k -s "$from" | grep -o 'URL=.*' | tr -d 'URL=*">'`
done < 2020NTT_redirect.txt
