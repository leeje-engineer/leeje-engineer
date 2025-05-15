#!/bin/bash

crontab_file="/usr/bin/crontab"
etc_crontab_file="/etc/crontab"
cron_deny_file="/etc/cron.deny"
required_permission=640

# /usr/bin/crontab 파일 권한 확인 및 변경
current_permission=$(stat -c %a "$crontab_file")
if [[ $current_permission -gt $required_permission ]]; then
    chmod $required_permission "$crontab_file"
    if [[ $? -eq 0 ]]; then
        echo "/usr/bin/crontab 파일의 권한이 변경되었습니다. 새로운 권한: $required_permission"
    else
        echo "/usr/bin/crontab 파일의 권한 변경 중 오류가 발생했습니다."
    fi
else
    echo "/usr/bin/crontab 파일의 권한이 $required_permission 이하입니다. 변경 작업이 필요하지 않습니다."
fi

# /etc/crontab 파일 권한 확인 및 변경
current_permission=$(stat -c %a "$etc_crontab_file")
if [[ $current_permission -gt $required_permission ]]; then
    chmod $required_permission "$etc_crontab_file"
    if [[ $? -eq 0 ]]; then
        echo "/etc/crontab 파일의 권한이 변경되었습니다. 새로운 권한: $required_permission"
    else
        echo "/etc/crontab 파일의 권한 변경 중 오류가 발생했습니다."
    fi
else
    echo "/etc/crontab 파일의 권한이 $required_permission 이하입니다. 변경 작업이 필요하지 않습니다."
fi

# /etc/cron.deny 파일 권한 확인 및 변경
current_permission=$(stat -c %a "$cron_deny_file")
if [[ $current_permission -gt $required_permission ]]; then
    chmod $required_permission "$cron_deny_file"
    if [[ $? -eq 0 ]]; then
        echo "/etc/cron.deny 파일의 권한이 변경되었습니다. 새로운 권한: $required_permission"
    else
        echo "/etc/cron.deny 파일의 권한 변경 중 오류가 발생했습니다."
    fi
else
    echo "/etc/cron.deny 파일의 권한이 $required_permission 이하입니다. 변경 작업이 필요하지 않습니다."
fi
