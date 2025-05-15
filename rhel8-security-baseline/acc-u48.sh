#!/bin/bash

# Check the minimum password age
MIN_AGE=$(sudo grep -E '^PASS_MIN_DAYS' /etc/login.defs | awk '{print $2}')

if [ $MIN_AGE -ge 1 ]; then
    echo "Minimum password age is already 1 day or more."
else
    echo "Minimum password age is less than 1 day, updating..."
    sudo sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS 1/' /etc/login.defs
    echo "Password policy updated successfully."
fi
