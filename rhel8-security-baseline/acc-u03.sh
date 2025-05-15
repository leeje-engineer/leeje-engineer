#!/bin/bash

# sssd 프로파일 생성 및 설정
authselect create-profile sssd
authselect select sssd --force

# faillock 정책 설정
authselect enable-feature with-faillock

# faillock.conf 파일 수정
sudo sed -i 's/# even_deny_root/even_deny_root/' /etc/security/faillock.conf
sudo sed -i 's/# deny = 3/deny = 10/' /etc/security/faillock.conf
sudo sed -i 's/# unlock_time = 600/unlock_time = 120/' /etc/security/faillock.conf

# 변경 사항 적용
authselect apply-changes

echo "Faillock 설정이 업데이트되었습니다."
