#!/bin/bash

# Check the minimum password length
MIN_LENGTH=$(sudo grep -E '^PASS_MIN_LEN' /etc/login.defs | awk '{print $2}')

if [ $MIN_LENGTH -lt 8 ]; then
    echo "Minimum password length is less than 8 characters, updating..."
    sudo sed -i 's/^PASS_MIN_LEN.*/PASS_MIN_LEN 8/' /etc/login.defs
    echo "Password policy updated successfully."
else
    echo "Minimum password length is already 8 characters or more."
fi
