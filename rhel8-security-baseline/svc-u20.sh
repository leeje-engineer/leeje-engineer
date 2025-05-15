#!/bin/bash

# Check if ftp service is active
if systemctl is-active vsftpd &> /dev/null ; then
    echo "FTP service is active"
    
    # Check if anonymous login is enabled
    if grep -q '^anonymous_enable=YES' /etc/vsftpd/vsftpd.conf ; then
        echo "Anonymous login is enabled"
        
        # Disable anonymous login
        sed -i 's/anonymous_enable=YES/anonymous_enable=NO/g' /etc/vsftpd/vsftpd.conf
        echo "Anonymous login has been disabled"
        
        # Restart vsftpd service
        systemctl restart vsftpd
        echo "vsftpd service has been restarted"
        
    else
        echo "Anonymous login is already disabled"
    fi
    
else
    echo "FTP service is not active"
fi
