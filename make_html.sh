#!/bin/sh

OUTPUT_DIR=$1

cat 2020NTT_redirect.txt | grep -v "html " | \
while IFS=" " read FROM TO; do
	FROM_WO_DOMAIN=`echo $FROM | sed 's%https://2020.ntt/%%g'`
	[ -d ${OUTPUT_DIR}/${FROM_WO_DOMAIN} ] || mkdir -p ${OUTPUT_DIR}/${FROM_WO_DOMAIN}
	cat source.html | sed "s%TO%${TO}%" > ${OUTPUT_DIR}/${FROM_WO_DOMAIN}index.html
done

cat 2020NTT_redirect.txt | grep "html " | \
while IFS=" " read FROM TO; do
	FROM_WO_DOMAIN=`echo $FROM | sed 's%https://2020.ntt/%%g'`
	[ -d `dirname ${OUTPUT_DIR}/${FROM_WO_DOMAIN}` ] || mkdir -p `dirname ${OUTPUT_DIR}/${FROM_WO_DOMAIN}`
	cat source.html | sed "s%TO%${TO}%" > ${OUTPUT_DIR}/${FROM_WO_DOMAIN}
done
