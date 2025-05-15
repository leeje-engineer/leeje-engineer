#!/bin/bash

# pwquality.conf 파일의 암호 설정 요구사항 변경
sed -i 's/^# minlen =.*/minlen = 8/' /etc/security/pwquality.conf
sed -i 's/^# dcredit =.*/dcredit = -1/' /etc/security/pwquality.conf
sed -i 's/^# ucredit =.*/ucredit = -1/' /etc/security/pwquality.conf
sed -i 's/^# lcredit =.*/lcredit = -1/' /etc/security/pwquality.conf
sed -i 's/^# ocredit =.*/ocredit = -1/' /etc/security/pwquality.conf
sed -i 's/^# minclass =.*/minclass = 4/' /etc/security/pwquality.conf

