#!/bin/bash

rm commits1.txt

for Dir in repositories/*/ ; do
(
	cd $Dir
	git rev-list --all --date-order --since='1 month ago' --author='tomas.maly@melown.com' --no-merges --pretty='format:%ad %s' --date=short | grep -v '^commit' >> ../../commits1.txt
)
done

cat commits1.txt | sort > commits.txt
rm commits1.txt

