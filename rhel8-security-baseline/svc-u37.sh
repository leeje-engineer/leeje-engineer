#!/bin/bash

# Check if httpd service is active
if ! systemctl is-active --quiet httpd; then
    echo "Apache service is not active."
    exit 1
fi

# Set up variables
httpd_conf_file="/etc/httpd/conf/httpd.conf"
httpd_user="apache"
web_dir="/var/www/html"

# Modify httpd.conf to deny access to parent directories
sed -i '/<Directory "/var/www"/,/AllowOverride None/ s/AllowOverride None/AllowOverride All/' $httpd_conf_file
sed -i '/<Directory "/var/www"/a  \ \ \ \ # Deny access to parent directories\n \ \ \ \ <Directory "'$web_dir'">\n \ \ \ \ \ \ \ \ Options FollowSymLinks\n \ \ \ \ \ \ \ \ AllowOverride All\n \ \ \ \ \ \ \ \ Order allow,deny\n \ \ \ \ \ \ \ \ Deny from all\n \ \ \ \ \ \ \ \ # Allow access to static files\n \ \ \ \ \ \ \ \ <Files ~ ".(jpg|jpeg|png|gif|js|css)$">\n \ \ \ \ \ \ \ \ \ \ \ \ Allow from all\n \ \ \ \ \ \ \ \ \ \ \ \ Satisfy any\n \ \ \ \ \ \ \ \ </Files>\n \ \ \ \ </Directory>' $httpd_conf_file

# Change ownership of web directory to apache user
chown -R $httpd_user:$httpd_user $web_dir

# Restart Apache service
systemctl restart httpd
