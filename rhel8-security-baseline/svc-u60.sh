#!/bin/bash

# Check if the SSH service is already installed
if [ ! -f /usr/sbin/sshd ]; then
  echo "Installing the SSH service..."
  sudo yum -y install openssh-server
else
  echo "The SSH service is already installed."
fi

# Check if the SSH service is already enabled and running
if sudo systemctl is-active sshd >/dev/null 2>&1 && sudo systemctl is-enabled sshd >/dev/null 2>&1; then
  echo "The SSH service is already enabled and running."
else
  echo "Enabling the SSH service..."
  sudo systemctl enable sshd
  sudo systemctl start sshd
  echo "The SSH service has been enabled and started."
fi
