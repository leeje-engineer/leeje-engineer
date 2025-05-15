#!/bin/bash

# check if /etc/passwd is owned by root
if [ "$(stat -c %U /etc/passwd)" != "root" ]; then
  echo "/etc/passwd is not owned by root, changing ownership to root"
  chown root:root /etc/passwd
fi

# check if /etc/passwd has permission less than 644
if [ "$(stat -c %a /etc/passwd)" -lt "644" ]; then
  echo "/etc/passwd has permission less than 644, changing permission to 644"
  chmod 644 /etc/passwd
fi
