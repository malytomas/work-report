#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo Usage: "$0 <git-url>"
	exit 1
fi

url=$1
dir=repositories/${url##*/}_`echo $url | md5sum - | cut -f1 -d' '`

if [[ -d $dir ]]; then
(
	cd $dir
	git fetch origin '*:*'
)
else
(
	git clone --bare "$url" "$dir"
	cd $dir
	git config gc.auto 0
)
fi

