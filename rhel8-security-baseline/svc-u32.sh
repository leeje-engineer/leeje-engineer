#!/bin/bash

# Check if SMTP service is running
if ! ps -ef | grep -q '[s]endmail'; then
  echo "sendmail service is not running"
  exit 0
fi

# Check if PrivacyOptions is already set
if grep -q '^dnl define(\`PRIVACY_OPTIONS' /etc/mail/sendmail.mc; then
  if grep -q '^define(\`PRIVACY_OPTIONS' /etc/mail/sendmail.mc; then
    echo "PrivacyOptions is already set"
  else
    echo "Setting PrivacyOptions..."
    sed -i 's/^dnl define(\`PRIVACY_OPTIONS.*/define(\`PRIVACY_OPTIONS', 'noexpn, noetrn, nodsn, nohelo, noreceipts, no-sender-retrace, no-8bitmime, authwarnings'\)/' /etc/mail/sendmail.mc
    m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf
    systemctl restart sendmail
    echo "PrivacyOptions has been set"
  fi
else
  echo "PrivacyOptions is not set"
fi
