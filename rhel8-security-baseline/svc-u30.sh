#!/bin/bash

# Check if sendmail service is running
if ps -ef | grep -q "[s]endmail"; then
    echo "sendmail service is running."
else
    echo "sendmail service is not running."
fi

# Check sendmail version
sendmail_version=$(sendmail -d0.4 -bv postmaster 2>&1 | grep "Version:" | awk '{print $2}')
if [ -n "$sendmail_version" ]; then
    echo "sendmail version: $sendmail_version"
else
    echo "Failed to determine sendmail version."