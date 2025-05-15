#!/bin/bash

# Check if DNS service is running
if ! ps -ef | grep -q '[n]amed'; then
  echo "DNS service is not running"
  exit 0
fi

# Check Bind version
bind_version=$(rpm -q bind | awk -F '-' '{print $2}')
echo "Bind version: $bind_version"
