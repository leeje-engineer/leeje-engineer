#!/bin/bash

# FTP 서비스 이름
FTP_SERVICE="vsftpd.service"

# FTP 서비스 상태 확인
FTP_STATUS=$(systemctl is-active $FTP_SERVICE)

# 만약 활성화되어 있다면 root 계정 접속 차단
if [ "$FTP_STATUS" == "active" ]; then
  # root 계정 접속 차단 확인
  if grep -q "^root" /etc/ftpusers; then
    echo "root 계정 접속이 이미 차단되어 있습니다."
  else
    echo "root" >> /etc/ftpusers
    echo "root 계정 접속이 차단되었습니다."
  fi
else
  echo "FTP 서비스가 비활성화되어 있습니다."
fi
