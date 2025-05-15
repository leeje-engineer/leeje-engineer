#!/bin/bash

# SNMP Community 파일 경로
SNMP_COMMUNITY_FILE="/etc/snmp/snmpd.conf"

# SNMP Community 이름 확인
SNMP_COMMUNITY=$(grep -E "^rocommunity\s+(public|private)" "$SNMP_COMMUNITY_FILE")

if [ -n "$SNMP_COMMUNITY" ]; then
  # SNMP Community 이름 삭제
  sed -i '/^rocommunity\s*\(public\|private\)\s*/d' "$SNMP_COMMUNITY_FILE"
  echo "SNMP Community 이름이 삭제되었습니다."
else
  echo "SNMP Community 이름이 존재하지 않습니다."
fi
