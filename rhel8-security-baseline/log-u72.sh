#!/bin/bash

# Check if /dev/console is present and uncommented in rsyslog.conf
if ! grep -q "^kern.* /dev/console" /etc/rsyslog.conf; then
  sed -i '/^#.*kern.* \/dev\/console/s/^#//' /etc/rsyslog.conf
fi

# Check if each of the following logs is present in rsyslog.conf
logs=(/var/log/messages /var/log/secure /var/log/maillog /var/log/cron)
for log in "${logs[@]}"
do
  if ! grep -q "^$log" /etc/rsyslog.conf; then
    echo "$log" >> /etc/rsyslog.conf
  fi
done

# Check if *.emerg is present and uncommented in rsyslog.conf
if ! grep -q "^*.emerg.*" /etc/rsyslog.conf; then
  echo "*.emerg.* /var/log/emerg" >> /etc/rsyslog.conf
fi

# Show the requested log policy contents of rsyslog.conf file
grep "^kern.* /dev/console" /etc/rsyslog.conf
grep "^/var/log/messages" /etc/rsyslog.conf
grep "^/var/log/secure" /etc/rsyslog.conf
grep "^/var/log/maillog" /etc/rsyslog.conf
grep "^/var/log/cron" /etc/rsyslog.conf
grep "^*.emerg.*" /etc/rsyslog.conf
