#!/bin/bash

# `ps -ef` 명령어를 사용하여 `autofs` 프로세스를 찾고, 해당 프로세스를 종료
autofs_process=$(ps -ef | grep -v grep | grep autofs)
if [[ -n "$autofs_process" ]]; then
    echo "autofs 서비스가 실행 중입니다. 서비스를 종료합니다."
    autofs_pid=$(ps -ef | grep -v grep | grep autofs | awk '{print $2}')
    kill "$autofs_pid"
    if [[ $? -eq 0 ]]; then
        echo "autofs 서비스를 성공적으로 종료했습니다."
    else
        echo "autofs 서비스를 종료하는 중 오류가 발생했습니다."
    fi
else
    echo "autofs 서비스가 실행 중이 아닙니다. 종료 작업이 필요하지 않습니다."
fi

