#!/bin/bash

# Set upload and download limit to 5MB
upload_limit="5M"
download_limit="5M"

# Check if upload limit is set in php.ini
if ! grep -q "^upload_max_filesize\s*=" /etc/php.ini ; then
  # If not, add the upload limit configuration to php.ini
  echo "upload_max_filesize = $upload_limit" >> /etc/php.ini
else
  # If yes, update the upload limit configuration in php.ini
  sed -i "s/^upload_max_filesize\s*=.*/upload_max_filesize = $upload_limit/g" /etc/php.ini
fi

# Check if download limit is set in httpd.conf
if ! grep -q "^LimitRequestBody\s*$download_limit" /etc/httpd/conf/httpd.conf ; then
  # If not, add the download limit configuration to httpd.conf
  echo "LimitRequestBody $download_limit" >> /etc/httpd/conf/httpd.conf
else
  # If yes, update the download limit configuration in httpd.conf
  sed -i "s/^LimitRequestBody\s*=.*/LimitRequestBody $download_limit/g" /etc/httpd/conf/httpd.conf
fi

# Restart Apache to apply changes
systemctl restart httpd

echo "Done"
