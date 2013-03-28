#!/bin/bash

# Deploy wrapper for update-from-tag.sh script
if [ -f ./settings/$1 ]; then
	file="$1.sh"
else
	file="main.sh"
fi

tag_count=$2
[ $tag_count ] || tag_count=1


./update-from-tag.sh $file $tag_count >> ./logs/$file.log 2>&1