#!/bin/sh

IFS="
"

for i in `cat 2020NTT_redirect.txt | sed 's%https://2020.ntt/%%g' | grep -v "html "`
do
	[ -d html/${i%% *} ] || mkdir -p html/${i%% *}
	cat source.html | sed "s%TO%${i##* }%" > html/${i%% *}index.html
done

for i in `cat 2020NTT_redirect.txt | sed 's%https://2020.ntt/%%g' | grep "html "`
do
	[ -d `dirname html/${i%% *}` ] || mkdir -p html/`dirname ${i%% *}`
	cat source.html | sed "s%TO%${i##* }%" > html/${i%% *}
done
