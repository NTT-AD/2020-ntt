#!/bin/sh

cat 2020NTT_redirect.txt | while IFS=" " read FROM TO; do
	printf "check... ${FROM} "
	curl -s ${FROM} | grep -w -q $TO
	if [ "$?" -ne 0 ]; then
		printf "ERROR!"
		exit 1
	fi
	printf "OK"
	echo
done
