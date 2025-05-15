#!/bin/bash

# Check if finger service is enabled
if systemctl is-enabled finger &> /dev/null; then
    echo "finger service is enabled"
    # Disable finger service in the finger configuration file
    sed -i '/disable/c\        disable         = yes' /etc/xinetd.d/finger
    echo "finger service has been disabled in the configuration file"
    # Restart xinetd service
    systemctl restart xinetd
    echo "xinetd service has been restarted"
else
    echo "finger service is not enabled"
fi
