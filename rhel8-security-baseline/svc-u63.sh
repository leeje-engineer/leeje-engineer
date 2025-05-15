#!/bin/bash

# ftpusers 파일 경로
FTPUSERS_FILE="/etc/ftpusers"

# ftpusers 파일 권한 확인
PERMISSION=$(stat -c %a $FTPUSERS_FILE)
if [ "$PERMISSION" -le 640 ]; then
  echo "ftpusers 파일의 권한이 640 이하입니다."
else
  chmod 640 $FTPUSERS_FILE
  chown root:root $FTPUSERS_FILE
  echo "ftpusers 파일의 권한과 소유자가 변경되었습니다."
fi
