#!/bin/bash

# Check if /etc/hosts.lpd file exists
if [ -f /etc/hosts.lpd ]; then
    echo "/etc/hosts.lpd file exists"
    
    # Change owner to root
    chown root /etc/hosts.lpd
    
    # Change permission to 600
    chmod 600 /etc/hosts.lpd
    
    echo "Owner of /etc/hosts.lpd file changed to root"
    echo "Permissions of /etc/hosts.lpd file changed to 600"
else
    echo "/etc/hosts.lpd file does not exist"
fi
