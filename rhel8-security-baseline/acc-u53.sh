#!/bin/bash

# 로그인이 불필요한 계정 목록
unneeded_accounts=("daemon" "bin" "sys" "adm" "listen" "nobody" "nobody4" "noaccess" "diag" "operator" "games" "gopher")

for account in "${unneeded_accounts[@]}"; do
    # 계정이 존재하는지 확인
    id "$account" &> /dev/null
    if [ $? -eq 0 ]; then
        # 계정이 존재하는 경우 /sbin/nologin 쉘 부여
        usermod -s /sbin/nologin "$account"
        echo "계정 '$account'의 쉘이 '/sbin/nologin'으로 변경되었습니다."
    else
        # 계정이 존재하지 않는 경우 메시지 출력
        echo "계정 '$account'가 존재하지 않습니다."
    fi
done
