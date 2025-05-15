#!/bin/bash

# Set the path to the Apache configuration file
APACHE_CONFIG_FILE="/etc/httpd/conf/httpd.conf"

# Check if the Apache configuration file exists
if [ -f "$APACHE_CONFIG_FILE" ]; then

  # Check if the ServerTokens directive is set to "Prod"
  if ! grep -q "^ServerTokens Prod" $APACHE_CONFIG_FILE; then
    # Add the ServerTokens directive to the Apache configuration file
    echo "ServerTokens Prod" >> $APACHE_CONFIG_FILE
    echo "The ServerTokens directive has been set to 'Prod' in the Apache configuration file."
  else
    echo "The ServerTokens directive is already set to 'Prod' in the Apache configuration file."
  fi

  # Check if the ServerSignature directive is set to "Off"
  if ! grep -q "^ServerSignature Off" $APACHE_CONFIG_FILE; then
    # Add the ServerSignature directive to the Apache configuration file
    echo "ServerSignature Off" >> $APACHE_CONFIG_FILE
    echo "The ServerSignature directive has been set to 'Off' in the Apache configuration file."
  else
    echo "The ServerSignature directive is already set to 'Off' in the Apache configuration file."
  fi

else
  echo "The Apache configuration file does not exist."
fi
