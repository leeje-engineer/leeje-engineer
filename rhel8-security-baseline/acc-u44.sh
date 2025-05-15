#!/bin/bash

# root 권한으로 실행하는지 확인
if [[ $(id -u) -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# /etc/passwd 파일에서 root 계정의 UID 확인
root_uid=$(grep "^root:" /etc/passwd | cut -d: -f3)

# root와 동일한 UID를 가진 계정이 있는지 확인하고 변경
while read -r line; do
  uid=$(echo "$line" | cut -d: -f3)
  if [[ $uid -eq $root_uid ]]; then
    username=$(echo "$line" | cut -d: -f1)
    echo "User $username has the same UID as root."
    read -p "Do you want to change $username's UID? (y/n) " choice
    if [[ $choice == [yY] ]]; then
      new_uid=$(shuf -i 1000-65534 -n 1)  # 무작위 UID 생성
      sed -i "s/^$username:[^:]*:$uid:/&$new_uid:/" /etc/passwd
      echo "Changed UID of $username from $uid to $new_uid."
    fi
  fi
done < /etc/passwd