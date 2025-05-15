#!/bin/bash

# FTP 프로세스 확인
FTP_PROCESS=$(ps -ef | grep -v grep | grep vsftpd)

# 만약 FTP 서비스가 실행 중이라면 중지하고 비활성화
if [ -n "$FTP_PROCESS" ]; then
  systemctl stop vsftpd.service
  systemctl disable vsftpd.service
  echo "FTP 서비스가 비활성화되었습니다."
else
  echo "FTP 서비스가 이미 비활성화되어 있습니다."
fi
