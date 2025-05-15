#!/bin/bash

# /etc/shadow 파일에서 패스워드 암호화 확인
if grep -q '^\w*:.\{1,2\}\([^\$]\|$\)' /etc/shadow; then
    echo "/etc/shadow 파일에서 패스워드 암호화가 확인되었습니다."
else
    echo "/etc/shadow 파일에서 패스워드 암호화를 찾을 수 없습니다."
    echo "pwconv 명령을 실행합니다."
    sudo pwconv
fi

# /etc/passwd 파일에서 두 번째 필드가 "x"로 표시되는지 확인
if grep -q '^[^:]\+:\s*x:' /etc/passwd; then
    echo "/etc/passwd 파일에서 두 번째 필드가 'x'로 표시되었습니다."
else
    echo "/etc/passwd 파일에서 두 번째 필드에 'x'로 표시된 것을 찾을 수 없습니다."
    echo "pwconv 명령을 실행합니다."
    sudo pwconv
fi