#!/bin/bash

curl https://api.github.com/users/malytomas/repos?per_page=1000 | grep clone_url | cut -d'"' -f4 > urls1.txt
curl https://api.github.com/users/melowntech/repos?per_page=1000 | grep clone_url | cut -d'"' -f4 >> urls1.txt

cat urls1.txt | sort --unique >> urls.txt
rm urls1.txt

while read line; do
	echo $line
	./back-repo.sh $line
	echo
done < urls.txt


