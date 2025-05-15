#!/bin/bash

# /etc/xinetd.conf 파일이 존재하는지 확인
if [[ ! -e "/etc/xinetd.conf" ]]; then
  echo "/etc/xinetd.conf 파일이 없습니다."
else
  # /etc/xinetd.conf 파일의 소유자가 root이고 권한이 600인지 확인
  if [[ $(stat -c "%U %a" /etc/xinetd.conf) == "root 600" ]]; then
    echo "/etc/xinetd.conf 파일의 소유자가 root이고 권한이 600입니다."
  else
    # 소유자를 root로 변경하고 권한을 600으로 수정
    chown root:root /etc/xinetd.conf
    chmod 600 /etc/xinetd.conf
    echo "/etc/xinetd.conf 파일의 소유자를 root로 변경하고 권한을 600으로 수정했습니다."
  fi
fi
