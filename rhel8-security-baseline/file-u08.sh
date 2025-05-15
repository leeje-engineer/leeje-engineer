#!/bin/bash

# check if /etc/shadow is owned by root and has permission less than 400
if [ "$(stat -c %U /etc/shadow)" = "root" ] && [ "$(stat -c %a /etc/shadow)" -le "400" ]; then
  echo "/etc/shadow is owned by root and has permission less than 400, changing ownership to root and permission to 400"
  chown root:root /etc/shadow
  chmod 400 /etc/shadow
fi
