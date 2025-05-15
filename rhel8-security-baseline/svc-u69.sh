#!/bin/bash

# Set the path to the NFS access control configuration file
NFS_CONFIG_FILE="/etc/exports"

# Check if the NFS access control configuration file exists
if [ -f "$NFS_CONFIG_FILE" ]; then

  # Get the current owner of the NFS access control configuration file
  OWNER=$(stat -c '%U' $NFS_CONFIG_FILE)
  
  # Get the current permission of the NFS access control configuration file
  PERMISSION=$(stat -c '%a' $NFS_CONFIG_FILE)

  # Check if the owner is not root or the permission is greater than 644
  if [ "$OWNER" != "root" ] || [ "$PERMISSION" -gt 644 ]; then
    
    # Change the owner to root
    chown root:root $NFS_CONFIG_FILE
    
    # Set the permission to 644
    chmod 644 $NFS_CONFIG_FILE
    
    echo "The ownership and permissions of the NFS access control configuration file have been changed."
  else
    echo "The ownership and permissions of the NFS access control configuration file are correct."
  fi
else
  echo "The NFS access control configuration file does not exist."
fi
