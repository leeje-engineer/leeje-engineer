#!/bin/bash

# Set the path to the Sendmail configuration file
SENDMAIL_CONFIG_FILE="/etc/mail/sendmail.cf"

# Check if Sendmail is running
if [ "$(systemctl is-active sendmail)" = "active" ]; then

  # Check if the Sendmail configuration file exists
  if [ -f "$SENDMAIL_CONFIG_FILE" ]; then

    # Check if the noexpn option is set in the Sendmail configuration file
    if ! grep -q "^O PrivacyOptions=noexpn" $SENDMAIL_CONFIG_FILE; then
      # Add the noexpn option to the Sendmail configuration file
      echo "O PrivacyOptions=noexpn" >> $SENDMAIL_CONFIG_FILE
      echo "The noexpn option has been added to the Sendmail configuration file."
    else
      echo "The noexpn option is already set in the Sendmail configuration file."
    fi

    # Check if the novrfy option is set in the Sendmail configuration file
    if ! grep -q "^O PrivacyOptions=novrfy" $SENDMAIL_CONFIG_FILE; then
      # Add the novrfy option to the Sendmail configuration file
      echo "O PrivacyOptions=novrfy" >> $SENDMAIL_CONFIG_FILE
      echo "The novrfy option has been added to the Sendmail configuration file."
    else
      echo "The novrfy option is already set in the Sendmail configuration file."
    fi
  else
    echo "The Sendmail configuration file does not exist."
  fi
else
  echo "The Sendmail service is not running."
fi
