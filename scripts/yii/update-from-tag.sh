#!/bin/bash

# The output of this script should be logged. Do not run it, use prod.sh for going to PROD.
date +%Y-%m-%d_%H:%M
echo ;

echo "1) Get last tag."
project=$1
file=$2
tag_count=$3
source ./settings/$project/$file
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

echo "4) Set permissions for assets and runtime dirs"
chmod 777 -R assets protected/runtime

# Delimiter
echo ;
echo ;
