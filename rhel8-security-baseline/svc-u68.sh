#!/bin/bash

# Check if telnet is enabled
if ! rpm -q telnet &> /dev/null; then
  echo "Telnet is not installed."
else
  # Add warning message to /etc/motd
  echo "Warning: Unauthorized access prohibited" >> /etc/motd
fi

# Check if ftp is enabled
if ! rpm -q vsftpd &> /dev/null; then
  echo "FTP is not installed."
else
  # Add warning message to /etc/issue.net
  echo "Warning: Unauthorized access prohibited" >> /etc/issue.net
  
  # Add warning message to /etc/vsftpd/vsftpd.conf
  echo "banner_file=/etc/issue.net" >> /etc/vsftpd/vsftpd.conf
fi

# Check if smtp is enabled
if ! rpm -q postfix &> /dev/null; then
  echo "SMTP is not installed."
else
  # Add warning message to /etc/issue.net
  echo "Warning: Unauthorized access prohibited" >> /etc/issue.net
fi

# Check if dns is enabled
if ! rpm -q bind &> /dev/null; then
  echo "DNS is not installed."
else
  # Add warning message to /etc/named.conf
  echo "options {" >> /etc/named.conf
  echo "  # Warning message" >> /etc/named.conf
  echo "  banner \"Warning: Unauthorized access prohibited\";" >> /etc/named.conf
  echo "};" >> /etc/named.conf
fi

# Check if sendmail is enabled
if ! rpm -q sendmail &> /dev/null; then
  echo "Sendmail is not installed."
else
  # Add warning message to /etc/mail/sendmail.cf
  echo "O SmtpGreetingMessage=Warning: Unauthorized access prohibited" >> /etc/mail/sendmail.cf
fi
