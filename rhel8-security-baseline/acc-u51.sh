#!/bin/bash

# 리스트에서 제외할 그룹 이름
EXCLUDE_GROUPS=("root" "bin" "daemon" "sys" "adm" "disk" "wheel" "nobody")

# /etc/group 파일에서 그룹 이름만 추출하여 배열에 저장
GROUPS=($(awk -F: '{print $1}' /etc/group))

# 불필요한 그룹 삭제
for GROUP in "${GROUPS[@]}"; do
  if ! [[ " ${EXCLUDE_GROUPS[*]} " =~ " ${GROUP} " ]]; then
    if grep -q "^${GROUP}:" /etc/group; then
      groupdel "${GROUP}"
      echo "${GROUP} 그룹이 삭제되었습니다."
      DELETED_GROUPS+=("${GROUP}")
    fi
  fi
done

# 삭제된 그룹들을 출력
if [ ${#DELETED_GROUPS[@]} -eq 0 ]; then
  echo "삭제된 그룹이 없습니다."
else
  echo "다음 그룹들이 삭제되었습니다:"
  for GROUP in "${DELETED_GROUPS[@]}"; do
    echo "${GROUP}"
  done
fi

echo "불필요한 그룹 삭제가 완료되었습니다."
