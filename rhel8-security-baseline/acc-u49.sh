#!/bin/bash

# 불필요한 시스템 계정을 배열로 저장합니다.
UNNEEDED_ACCOUNTS=(lp uucp nuucp)

# 각 계정이 존재하는지 확인하고 삭제합니다.
for ACCOUNT in "${UNNEEDED_ACCOUNTS[@]}"
do
  id $ACCOUNT > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    userdel -r $ACCOUNT
    echo "$ACCOUNT 계정이 삭제되었습니다."
  else
    echo "$ACCOUNT 계정이 존재하지 않습니다."
  fi
done
