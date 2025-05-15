#!/bin/bash

# /etc/passwd 파일에서 3번째 필드를 추출하여 중복을 확인합니다.
duplicates=$(cut -d: -f3 /etc/passwd | sort | uniq -d)

# 중복된 사용자가 없는 경우 메시지를 출력하고 종료합니다.
if [ -z "$duplicates" ]; then
  echo "중복된 사용자가 없습니다."
  exit 0
fi

# 중복된 사용자가 있는 경우 출력합니다.
echo "다음 사용자들의 UID가 동일합니다:"
while read -r user; do
  grep "^$user:" /etc/passwd
done <<< "$duplicates"
