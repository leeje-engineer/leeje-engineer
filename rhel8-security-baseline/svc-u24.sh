#!/bin/bash

# NFS 서비스와 관련된 데몬의 목록
NFS_DEAMONS=(nfs-lock rpc-statd nfs-idmapd)

# 각 데몬의 상태를 확인하고, 활성화되어 있다면 비활성화
for daemon in ${NFS_DEAMONS[@]}; do
    if systemctl is-enabled $daemon > /dev/null; then
        echo "Disabling $daemon"
        systemctl disable $daemon
    fi
done
