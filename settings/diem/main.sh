#!/bin/bash

# General settings

svn_path="svn://svn.your-svn-server.com/your-svn-repo"
site_path="/path/to/your/project/folder/"

tag=`svn log -v "$svn_path/tags" | awk '/^   A/ { print $2 }' | head -$tag_count`

# PROD ENV
owner=prod_user_name
owner=prod_user_name
svn_path="$svn_path$tag"

# TEST ENV (uncomment code below for test on local or test env)
# site_path="/path/to/your/local|test/project/folder/"
# svn_path="svn://svn.your-svn-server.com/your-svn-repo"
# owner=local_user_name
# owner=local_user_name
