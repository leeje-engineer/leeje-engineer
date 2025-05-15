#!/bin/bash

# Find all directories with Options directive in httpd.conf
dir_list=$(grep -r "^\s*<Directory" /etc/httpd/conf/httpd.conf | awk -F'"' '{print $2}')

# Loop through directories and remove FollowSymLinks option
for dir in $dir_list
do
  file="/etc/httpd/conf/httpd.conf"
  # Remove FollowSymLinks option if it exists
  sed -i "/<Directory \"$dir\">/,/<\/Directory>/ s/FollowSymLinks//g" $file
done

echo "Done"
