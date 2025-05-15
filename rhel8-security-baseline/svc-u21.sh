#!/bin/bash

# Check if xinetd service is installed
if ! rpm -qa | grep -qw xinetd; then
    echo "xinetd service is not installed"
    exit 1
fi

# Check if rsh, rlogin, rexec services are enabled
for service in rsh rlogin rexec; do
    if systemctl is-active "$service" &> /dev/null; then
        echo "$service service is running"
        if [[ -f "/etc/xinetd.d/$service" ]]; then
            echo "Disabling $service service"
            sed -i 's/disable\s*=.*/disable = yes/' "/etc/xinetd.d/$service"
            systemctl reload xinetd
            echo "Successfully disabled $service service"
        else
            echo "$service service configuration file not found"
        fi
    else
        echo "$service service is not running"
    fi
done
