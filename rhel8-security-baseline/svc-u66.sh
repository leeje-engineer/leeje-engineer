#!/bin/bash

# SNMP 서비스 이름
SNMP_SERVICE="snmpd"

# SNMP 서비스 상태 확인
SNMP_STATUS=$(ps -ef | grep -v grep | grep "$SNMP_SERVICE")

# 만약 활성화되어 있다면 kill 명령어로 서비스 종료
if [ -n "$SNMP_STATUS" ]; then
  # SNMP 서비스 프로세스 ID 확인
  SNMP_PID=$(echo "$SNMP_STATUS" | awk '{print $2}')
  # SNMP 서비스 종료
  kill "$SNMP_PID"
  echo "SNMP 서비스가 비활성화되었습니다."
else
  echo "SNMP 서비스가 비활성화되어 있습니다."
fi
