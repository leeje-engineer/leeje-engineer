#!/bin/bash

# Check if /etc/hosts.equiv file exists
if [ -e "/etc/hosts.equiv" ]; then
  # Set owner to root and permission to 600
  chown root:root /etc/hosts.equiv
  chmod 600 /etc/hosts.equiv
else
  echo "/etc/hosts.equiv does not exist"
fi

# Check if ~/.rhosts file exists for the current user
if [ -e "$HOME/.rhosts" ]; then
  # Set owner to the current user and permission to 600
  chown "$USER":"$USER" "$HOME/.rhosts"
  chmod 600 "$HOME/.rhosts"
else
  echo "$HOME/.rhosts does not exist"
fi
