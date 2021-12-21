#!/bin/sh

IFS="
"

for i in `cat 2020NTT_redirect.txt | sed 's%https://2020.ntt/%%g' | grep -v "html "`
do
	[ -d ${i%% *} ] || mkdir -p ${i%% *}
	cat source.html | sed "s%TO%${i##* }%" > ${i%% *}index.html
done

for i in `cat 2020NTT_redirect.txt | sed 's%https://2020.ntt/%%g' | grep "html "`
do
	[ -d `dirname ${i%% *}` ] || mkdir -p `dirname ${i%% *}`
	cat source.html | sed "s%TO%${i##* }%" > ${i%% *}
done
