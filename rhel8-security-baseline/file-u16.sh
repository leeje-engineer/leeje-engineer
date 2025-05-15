#!/bin/bash

echo "Nonexistent device files in /dev:"
echo "================================="

# /dev 디렉토리의 모든 파일을 검색합니다.
# 파일 타입이 'c' 또는 'b'인 파일(디바이스 파일)을 찾습니다.
# 파일의 소유자, 그룹, 권한 등을 검사하여 디바이스 파일인지 확인합니다.
# 파일 이름이 존재하지 않는 경우 출력합니다.
find /dev -type c -o -type b -exec sh -c 'test ! -e "{}" && echo {}' \;
