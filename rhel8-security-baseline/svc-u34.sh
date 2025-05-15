#!/bin/bash

# Check if DNS service is running
if ! ps -ef | grep -q '[n]amed'; then
  echo "DNS service is not running"
  exit 0
fi

# Check allow-transfer and xfrnets configuration
allow_transfer=$(grep -E "^\\s*allow-transfer\\s*\\{$" /etc/named.conf -A 1 | grep -v "{")
xfrnets=$(grep -E "^\\s*xfrnets\\s*\\{$" /etc/named.conf -A 1 | grep -v "{")

if [[ -z "$allow_transfer" && -z "$xfrnets" ]]; then
  echo "allow-transfer and xfrnets are not configured"
elif [[ -z "$allow_transfer" ]]; then
  echo "allow-transfer is not configured"
elif [[ -z "$xfrnets" ]]; then
  echo "xfrnets is not configured"
else
  if [[ "$allow_transfer" == *"any"* && "$xfrnets" == *"any"* ]]; then
    echo "allow-transfer and xfrnets are configured for any IP address"
  else
    echo "allow-transfer and xfrnets are not configured for any IP address"
  fi
fi
