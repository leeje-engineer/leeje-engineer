#!/bin/bash

# Define list of services that are potentially vulnerable to DoS attacks
vulnerable_services=("chargen" "daytime" "discard" "echo" "time")

# Loop through list of services and disable their xinetd configuration files
for service in "${vulnerable_services[@]}"; do
    file="/etc/xinetd.d/$service"
    if [ -f "$file" ]; then
        sed -i 's/^\s*enabled\s*=.*$/enabled = no/' "$file"
        echo "Disabled $service"
    fi
done

# Restart xinetd service to apply changes
systemctl restart xinetd
