#!/bin/bash

# NFS export 설정 파일 경로
NFS_EXPORTS_FILE="/etc/exports"

# NFS 설정 파일에서 everyone 공유 허용 여부 확인
everyone_allowed=$(grep -E "^/.*\s+.*\s+.*(rw,)?no_root_squash\s*$" $NFS_EXPORTS_FILE)

if [[ -n "$everyone_allowed" ]]; then
  echo "everyone 공유가 제한되지 않았습니다."
  
  # everyone 공유 제한 명령 실행
  echo "everyone 공유를 제한합니다..."
  sed -i 's/^\(\/.*\s\+.*\s\+\)\(rw[^,]*,\)\?no_root_squash\s*$/\1noaccess,no_root_squash/g' $NFS_EXPORTS_FILE
  
  # NFS 서비스 재시작
  systemctl restart nfs-server
  
  echo "제한이 완료되었습니다."
else
  echo "everyone 공유가 제한되어 있습니다."
fi
