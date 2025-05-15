#!/bin/bash

services=("ypserv" "ypxfrd" "rpc.yppasswdd" "rpc.ypupdated")

for service in "${services[@]}"; do
    service_process=$(ps -ef | grep -v grep | grep "$service")
    if [[ -n "$service_process" ]]; then
        echo "$service 서비스가 실행 중입니다. 서비스를 종료합니다."
        service_pid=$(ps -ef | grep -v grep | grep "$service" | awk '{print $2}')
        kill "$service_pid"
        if [[ $? -eq 0 ]]; then
            echo "$service 서비스를 성공적으로 종료했습니다."
        else
            echo "$service 서비스를 종료하는 중 오류가 발생했습니다."
        fi
    else
        echo "$service 서비스가 실행 중이 아닙니다. 종료 작업이 필요하지 않습니다."
    fi
done

