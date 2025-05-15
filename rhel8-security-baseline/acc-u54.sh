#!/bin/bash

# 사용자 쉘에 대한 환경설정 파일 경로
CONFIG_FILE="/etc/profile"

# session timeout 설정값
TIMEOUT_VALUE="600"

# 환경설정 파일이 존재하지 않으면 생성
if [ ! -f "$CONFIG_FILE" ]; then
    touch "$CONFIG_FILE"
fi

# 이미 session timeout 설정이 되어 있는지 확인
if grep -q "TMOUT=" "$CONFIG_FILE"; then
    echo "Session timeout is already configured."
else
    # session timeout 설정이 되어 있지 않으면 설정값을 추가
    echo "TMOUT=$TIMEOUT_VALUE" >> "$CONFIG_FILE"
    echo "export TMOUT" >> "$CONFIG_FILE"
    echo "Session timeout has been set to $TIMEOUT_VALUE seconds and exported."
fi
