#!/bin/bash

hosts_file="/etc/hosts"

# 소유자와 소유그룹 확인
current_owner=$(stat -c '%U' "$hosts_file")
current_group=$(stat -c '%G' "$hosts_file")

# 권한 확인
current_permissions=$(stat -c '%a' "$hosts_file")

# 소유자가 root가 아니거나 권한이 600 이상인 경우에만 수정 작업 수행
if [[ $current_owner != "root" || $current_permissions -gt 600 ]]; then
    echo "Modifying ownership and permissions of /etc/hosts..."

    # 소유자와 소유그룹 변경
    chown root:root "$hosts_file"

    # 권한 변경
    chmod 600 "$hosts_file"

    echo "Done."
else
    echo "/etc/hosts is already owned by root and has appropriate permissions."
fi
