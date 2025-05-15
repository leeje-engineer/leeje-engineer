#!/bin/bash

# Check the maximum password age
MAX_AGE=$(sudo grep -E '^PASS_MAX_DAYS' /etc/login.defs | awk '{print $2}')

if [ $MAX_AGE -le 90 ]; then
    echo "Maximum password age is already 90 days or less."
else
    echo "Maximum password age is greater than 90 days, updating..."
    sudo sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS 90/' /etc/login.defs
    echo "Password policy updated successfully."
fi
