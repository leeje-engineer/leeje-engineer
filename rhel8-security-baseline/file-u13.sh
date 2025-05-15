#!/bin/bash

# SUID 설정 확인
echo "SUID 설정 확인 중..."
find / -perm -4000 -type f -print

# SGID 설정 확인
echo "SGID 설정 확인 중..."
find / -perm -2000 -type f -print
