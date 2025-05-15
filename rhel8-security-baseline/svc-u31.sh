#!/bin/bash

# Check if sendmail service is running
if ps -ef | grep -q "[s]endmail"; then
    echo "sendmail service is running."
else
    echo "sendmail service is not running."
    exit 1
fi

# Check if relay control is already set
if grep -q "RelayControl" /etc/mail/sendmail.mc; then
    echo "Relay control is already set."
else
    # Add relay control settings to sendmail.mc file
    echo "define(\`RELAY_MAILER_ARGS', \`TCP \$h 587')" >> /etc/mail/sendmail.mc
    echo "define(\`SMART_HOST', \`relayhost.example.com')" >> /etc/mail/sendmail.mc
    echo "define(\`RELAY_MAILER', \`esmtp')" >> /etc/mail/sendmail.mc

    # Rebuild sendmail configuration files
    m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf

    # Restart sendmail service
    systemctl restart sendmail.service

    echo "Relay control has been set."
fi
