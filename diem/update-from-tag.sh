#!/bin/bash

# The output of this script should be logged. Do not run it, use prod.sh for going to PROD.
date +%Y-%m-%d_%H:%M
echo ;

echo "1) Get last tag."
file=$1
tag_count=$2
source ./settings/$file
echo $tag

echo "2) Check if directory exists and go there."
if [ ! -d "$site_path" ]; then
  mkdir $site_path
fi
cd $site_path
echo "Going to $site_path"

echo "3) Try to get svn info. If errros => checkout, else => revert & switch."
svn info | grep URL
error=$?

if [[ $error -ne 0 ]]; then
  echo "svn checkout from $svn_path"
  svn checkout $svn_path .
else
  echo "svn switch to $svn_path"
  svn revert -R .
  svn sw $svn_path
fi

svn up

echo "4) Fix permissions for cache and log folders"
chmod 777 -R cache log

echo "5) Setup diem"
php symfony dm:setup


# Delimiter
echo ;
echo ;