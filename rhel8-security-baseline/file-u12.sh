#!/bin/bash

# /etc/services 파일의 소유자와 권한을 가져옵니다.
owner=$(stat -c "%U" /etc/services)
permissions=$(stat -c "%a" /etc/services)

# 소유자가 root이고 권한이 644 이상인지 확인합니다.
if [[ $owner == "root" ]] && ((permissions >= 644)); then
  echo "/etc/services 파일의 소유자가 root이고 권한이 644 이상입니다."
else
  # 소유자를 root로 변경하고 권한을 644로 수정합니다.
  chown root /etc/services
  chmod 644 /etc/services
  echo "/etc/services 파일의 소유자를 root로 변경하고 권한을 644로 수정했습니다."
fi
