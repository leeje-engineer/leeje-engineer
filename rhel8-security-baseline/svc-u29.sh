#!/bin/bash

# Check if xinetd package is installed
if ! rpm -qa | grep -qw xinetd; then
    echo "xinetd package is not installed."
    exit 1
fi

# Check if /etc/xinetd.d/ directory exists
if [ ! -d "/etc/xinetd.d/" ]; then
    echo "/etc/xinetd.d/ directory does not exist. Aborting."
    exit 1
fi

# Loop through the files in /etc/xinetd.d/ directory
for file in /etc/xinetd.d/*; do
    # Check if file is a regular file and not a directory or symlink
    if [ -f "$file" ]; then
        # Check if tftp, falk, or ntalk service is enabled
        if grep -q "disable[[:space:]]*=[[:space:]]*no" "$file" && \
           (grep -q "service[[:space:]]*tftp" "$file" || \
            grep -q "service[[:space:]]*falk" "$file" || \
            grep -q "service[[:space:]]*ntalk" "$file"); then
            # Disable the service by setting disable to yes
            sed -i 's/disable[[:space:]]*=[[:space:]]*no/disable = yes/g' "$file"
            echo "Disabled service in $file"
        fi
    fi
done
