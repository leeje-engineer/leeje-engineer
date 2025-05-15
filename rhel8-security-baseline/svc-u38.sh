#!/bin/bash

# Set up variables
manual_dir1="/etc/httpd/htdocs/manual"
manual_dir2="/etc/httpd/manual"

# Remove unnecessary files and directories in /etc/httpd/htdocs/manual
if [ -d "$manual_dir1" ]; then
    echo "Removing unnecessary files and directories in $manual_dir1"
    rm -rf "$manual_dir1/htdocs"
fi

# Remove unnecessary files and directories in /etc/httpd/manual
if [ -d "$manual_dir2" ]; then
    echo "Removing unnecessary files and directories in $manual_dir2"
    rm -rf "$manual_dir2/cgi-bin"
    rm -f "$manual_dir2/*.html*"
fi
