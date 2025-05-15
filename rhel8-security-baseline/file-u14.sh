#!/bin/bash

# 환경변수 파일 경로
env_files=(~/.bash_profile ~/.bashrc)

# 소유자 확인
echo "홈 디렉터리 내의 환경변수 파일의 소유자 확인 중..."
for file in "${env_files[@]}"
do
    if [ -e "$file" ]
    then
        owner=$(stat -c "%U" "$file")
        if [[ "$owner" == "root" || "$owner" == "$(whoami)" ]]
        then
            echo "$file의 소유자: $owner"
        else
            echo "$file의 소유자는 root 또는 해당 계정이어야 합니다."
            # root와 소유자만 쓰기 권한 부여
            sudo chown $(whoami):$(whoami) "$file"
            sudo chmod 600 "$file"
            echo "root와 소유자만 쓰기 권한이 부여되었습니다."
        fi
    else
        echo "$file이(가) 존재하지 않습니다."
    fi
done

# 쓰기 권한 확인
echo "홈 디렉터리 내의 환경변수 파일의 쓰기 권한 확인 중..."
for file in "${env_files[@]}"
do
    if [ -e "$file" ]
    then
        perm=$(stat -c "%a" "$file")
        if [ "${perm:2:1}" -ge 6 ]
        then
            echo "$file의 쓰기 권한: $perm"
        else
            echo "$file의 쓰기 권한이 충분하지 않습니다. root와 소유자만 쓰기 권한이 부여되어야 합니다."
            # root와 소유자만 쓰기 권한 부여
            sudo chown $(whoami):$(whoami) "$file"
            sudo chmod 600 "$file"
            echo "root와 소유자만 쓰기 권한이 부여되었습니다."
        fi
    else
        echo "$file이(가) 존재하지 않습니다."
    fi
done
