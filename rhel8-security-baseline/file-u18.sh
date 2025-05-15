#!/bin/bash

# Check if hosts.allow and hosts.deny files exist
if [[ -e /etc/hosts.allow && -e /etc/hosts.deny ]]; then
    # Check if there are any entries for sshd in hosts.allow
    if grep -q "sshd:.*" /etc/hosts.allow; then
        echo "Allowed hosts for SSH are defined in /etc/hosts.allow."
    else
        echo "No allowed hosts for SSH are defined in /etc/hosts.allow."
    fi

    # Check if there are any entries for sshd in hosts.deny
    if grep -q "sshd:.*" /etc/hosts.deny; then
        echo "Denied hosts for SSH are defined in /etc/hosts.deny."
    else
        echo "No denied hosts for SSH are defined in /etc/hosts.deny."
    fi
else
    echo "Either /etc/hosts.allow or /etc/hosts.deny does not exist."
fi

# Check if iptables rules exist for SSH
if iptables -L | grep -q "tcp.*--dport ssh"; then
    echo "There are iptables rules for SSH."
else
    echo "There are no iptables rules for SSH."
fi
