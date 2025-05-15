#!/bin/bash

# /etc/profile 파일에서 현재 UMASK 값을 찾아서 저장합니다.
CURRENT_UMASK=$(grep -o "umask [0-9]*" /etc/profile | awk '{print $2}')

# 만약 UMASK가 022가 아니라면 변경합니다.
if [ "$CURRENT_UMASK" != "022" ]; then
  # /etc/profile 파일에서 UMASK를 022로 변경합니다.
  sudo sed -i 's/umask [0-9]*/umask 022/' /etc/profile
  echo "UMASK를 022로 변경했습니다."
else
  echo "현재 UMASK는 이미 022입니다."
fi
