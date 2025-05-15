#!/bin/bash

# Apache 데몬의 사용자와 그룹을 root으로 변경하는 스크립트

# Apache 데몬의 현재 사용자와 그룹 확인
httpd_user=$(ps aux | grep httpd | grep -v grep | awk '{print $1}')
httpd_group=$(ps aux | grep httpd | grep -v grep | awk '{print $2}')

if [ -z "$httpd_user" ]; then
  echo "Apache 데몬이 실행 중이지 않습니다."
else
  echo "현재 Apache 데몬의 사용자: $httpd_user"
  echo "현재 Apache 데몬의 그룹: $httpd_group"

  # Apache 데몬의 사용자와 그룹을 root으로 변경
  sed -i 's/User .*/User root/' /etc/httpd/conf/httpd.conf
  sed -i 's/Group .*/Group root/' /etc/httpd/conf/httpd.conf

  echo "Apache 데몬의 사용자를 root로 변경했습니다."
  echo "Apache 데몬의 그룹을 root로 변경했습니다."

  # 변경된 설정 적용을 위해 Apache 데몬 재시작
  systemctl restart httpd
fi
