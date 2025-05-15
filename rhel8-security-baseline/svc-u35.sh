#!/bin/bash

# Check if directory indexing is enabled
if grep -q "Options.*Indexes" /etc/httpd/conf/httpd.conf; then
  echo "Directory indexing is enabled"
  
  # Remove 'Indexes' option from all directories
  sed -i '/<Directory .*>\|<\/Directory>/!d; /<Directory /i <Directory />\nOptions -Indexes\n</Directory>' /etc/httpd/conf/httpd.conf
  
  echo "Removed 'Indexes' option from all directories in httpd.conf"
else
  echo "Directory indexing is not enabled"
fi
