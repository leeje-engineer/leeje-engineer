#!/bin/bash

# Check if all users are allowed to use the 'su' command
if grep -q '^auth\s*required\s*pam_wheel.so' /etc/pam.d/su; then
    # Find all users who are allowed to use the 'su' command
    allowed_users=$(grep '^wheel:' /etc/group | cut -d':' -f4 | tr ',' '\n')

    if [[ -n $allowed_users ]]; then
        echo "The following users are allowed to use the 'su' command:"
        echo "$allowed_users"
    else
        echo "No users are allowed to use the 'su' command."
    fi
else
    echo "All users are allowed to use the 'su' command."
fi


