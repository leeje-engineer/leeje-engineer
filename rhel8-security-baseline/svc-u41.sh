#!/bin/bash

# Set the new DocumentRoot directory here
new_docroot="/path/to/new/docroot"

# Check if the Apache configuration file exists
if [ -f /etc/httpd/conf/httpd.conf ]; then
  # Check if the DocumentRoot is set to a default value
  if grep -q "DocumentRoot \"/usr/local/apache/htdocs\"" /etc/httpd/conf/httpd.conf \
    || grep -q "DocumentRoot \"/usr/local/apache2/htdocs\"" /etc/httpd/conf/httpd.conf \
    || grep -q "DocumentRoot \"/var/www/html\"" /etc/httpd/conf/httpd.conf; then

    # Update the DocumentRoot configuration
    sed -i "s#DocumentRoot \"/usr/local/apache/htdocs\"#DocumentRoot \"$new_docroot\"#g" /etc/httpd/conf/httpd.conf
    sed -i "s#DocumentRoot \"/usr/local/apache2/htdocs\"#DocumentRoot \"$new_docroot\"#g" /etc/httpd/conf/httpd.conf
    sed -i "s#DocumentRoot \"/var/www/html\"#DocumentRoot \"$new_docroot\"#g" /etc/httpd/conf/httpd.conf

    # Update the Directory configuration with new DocumentRoot path
    sed -i "s#<Directory \"/usr/local/apache/htdocs\">#<Directory \"$new_docroot\">#g" /etc/httpd/conf/httpd.conf
    sed -i "s#<Directory \"/usr/local/apache2/htdocs\">#<Directory \"$new_docroot\">#g" /etc/httpd/conf/httpd.conf
    sed -i "s#<Directory \"/var/www/html\">#<Directory \"$new_docroot\">#g" /etc/httpd/conf/httpd.conf

    echo "DocumentRoot has been updated to $new_docroot."
  else
    echo "DocumentRoot is already set to a custom directory."
  fi
else
  echo "Apache configuration file not found."
fi
