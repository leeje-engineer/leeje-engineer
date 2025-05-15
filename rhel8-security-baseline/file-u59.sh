#!/bin/bash

# 의심스러운 파일 목록을 저장할 변수 초기화
suspicious_files=""

# 현재 디렉터리에서 숨김 파일과 디렉터리 검색
for file in $(find . -name ".*" -type f -o -type d); do
  # 소유자가 root인 파일은 검사하지 않음
  if [ "$(stat -c %U $file)" = "root" ]; then
    continue
  fi
  
  # 파일 권한이 777인 파일은 검사하지 않음
  if [ "$(stat -c %a $file)" = "777" ]; then
    continue
  fi
  
  # 의심스러운 파일을 검출하는 패턴 추가
  suspicious_pattern="password|secret|key|cred|auth|login|sshd_config|shadow"
  if grep -q "$suspicious_pattern" "$file"; then
    suspicious_files="$suspicious_files $file"
  fi
done

# 의심스러운 파일이 있으면 출력
if [ "$suspicious_files" != "" ]; then
  echo "의심스러운 파일이 발견되었습니다:"
  echo "$suspicious_files"
else
  echo "의심스러운 파일이 없습니다."
fi
