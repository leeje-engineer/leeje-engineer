#!/bin/bash

# Define the admin group name
ADMIN_GROUP="admin"

# Define the list of accounts to exclude from deletion
EXCLUDE_ACCOUNTS=("root" "admin")

# Get the list of accounts in the admin group
ACCOUNTS=$(getent group $ADMIN_GROUP | cut -d: -f4 | tr ',' ' ')

# Define a variable to keep track of whether any unnecessary accounts were found
FOUND_UNNECESSARY=false

# Loop through the accounts and check if they should be deleted
for account in $ACCOUNTS; do
  # Skip accounts that should be excluded
  if [[ "${EXCLUDE_ACCOUNTS[@]}" =~ "${account}" ]]; then
    continue
  fi

  # Check if the account is a system account (UID < 1000)
  if [ $(id -u $account) -lt 1000 ]; then
    echo "Skipping system account: $account"
    continue
  fi

  # Check if the account has any active processes
  if [ $(ps -u $account | wc -l) -gt 1 ]; then
    echo "Skipping active account: $account"
    continue
  fi

  # Mark that an unnecessary account was found
  FOUND_UNNECESSARY=true

  # Print the unnecessary account
  echo "Unnecessary account found in admin group: $account"
done

# Print all accounts in the admin group
echo "Accounts in admin group:"
echo "$ACCOUNTS"

# Check if any unnecessary accounts were found
if [ "$FOUND_UNNECESSARY" = true ]; then
  echo "WARNING: Unnecessary accounts were found in the admin group."
else
  echo "SUCCESS: No unnecessary accounts were found in the admin group."
fi
