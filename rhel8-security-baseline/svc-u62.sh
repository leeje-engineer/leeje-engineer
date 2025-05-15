#!/bin/bash

# ftp 계정 이름
FTP_USER="ftp"

# /etc/passwd 파일에서 ftp 계정의 쉘 정보 확인
CURRENT_SHELL=$(grep "^$FTP_USER:" /etc/passwd | cut -d ':' -f 7)

# 만약 쉘이 /bin/false가 아니라면 /bin/false로 변경
if [ "$CURRENT_SHELL" != "/bin/false" ]; then
  usermod -s /bin/false $FTP_USER
  echo "ftp 기본 계정에 /bin/false 쉘이 부여되었습니다."
else
  echo "ftp 기본 계정에 이미 /bin/false 쉘이 부여되어 있습니다."
fi
