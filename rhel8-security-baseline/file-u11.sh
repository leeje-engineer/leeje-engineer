#!/bin/bash

# /etc/rsyslog.conf 파일의 소유자와 권한을 가져옵니다.
owner=$(stat -c "%U" /etc/rsyslog.conf)
permissions=$(stat -c "%a" /etc/rsyslog.conf)

# 소유자가 root, bin, sys 중 하나이고 권한이 640 이하인지 확인합니다.
if [[ $owner =~ ^(root|bin|sys)$ ]] && ((permissions <= 640)); then
  echo "/etc/rsyslog.conf 파일의 소유자가 root, bin, sys 중 하나이고 권한이 640 이하입니다."
else
  # 소유자를 root로 변경하고 권한을 640으로 수정합니다.
  chown root /etc/rsyslog.conf
  chmod 640 /etc/rsyslog.conf
  echo "/etc/rsyslog.conf 파일의 소유자를 root로 변경하고 권한을 640으로 수정했습니다."
fi
