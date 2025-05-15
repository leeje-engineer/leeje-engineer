#!/bin/bash

# at 관련 파일 경로
AT_DENY_FILE="/etc/at.deny"
AT_ALLOW_FILE="/etc/at.allow"
AT_SPOOL_DIR="/var/spool/at/"

# at 명령어 실행 권한 확인
if [ -f "$AT_DENY_FILE" ]; then
  echo "일반 사용자의 at 명령어 실행이 이미 제한되어 있습니다."
else
  touch $AT_DENY_FILE
  chmod 640 $AT_DENY_FILE
  echo "ALL" > $AT_DENY_FILE
  echo "일반 사용자의 at 명령어 실행이 제한되었습니다."
fi

# at 관련 파일 권한 설정
chmod -R 640 $AT_SPOOL_DIR
chmod 640 $AT_ALLOW_FILE
chown root:daemon $AT_SPOOL_DIR $AT_ALLOW_FILE
echo "at 관련 파일의 권한이 변경되었습니다."
