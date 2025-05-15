#!/bin/bash

echo "World-writable files:"
echo "======================"

# 현재 디렉토리부터 시작해서 모든 파일을 재귀적으로 검색합니다.
# 파일 모드(permissions)가 777인 파일을 찾아서 출력합니다.
find / -type f -perm -o=w -ls 2>/dev/null | awk '{print $NF}'
