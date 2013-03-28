#!/bin/bash

# Deploy wrapper for update-from-tag.sh script


if [ ! $1 ] || [ ! -d "./scripts/$1" ]; then
	echo "Please specify project type as first argument: diem|yii"
	exit 0;
fi

project=$1

if [ -f ./settings/$1/$2 ]; then
	file="$2.sh"
else
	file="main.sh"
fi

tag_count=$2
[ $tag_count ] || tag_count=1

./scripts/$1/update-from-tag.sh $project $file $tag_count >> ./logs/$1/$file.log 2>&1