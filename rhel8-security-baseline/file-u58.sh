#!/bin/bash

while IFS=: read -r username password uid gid full_name home_dir shell
do
  if [ "$username" != "" ] && [ "$username" != "root" ] && [ "$username" != "sync" ] && [ "$username" != "shutdown" ] && [ "$username" != "halt" ]; then
    if [ "$home_dir" != "/home/$username" ]; then
      echo "사용자 계정과 홈 디렉터리가 일치하지 않습니다: $username"
    fi
  fi
done < /etc/passwd
