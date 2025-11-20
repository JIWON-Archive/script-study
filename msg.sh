#!/bin/bash
Servers="node1 node2 node3"

# 날짜와 함께 문자열 출력 함수
function print_msg()
{
  Message=$1
  Date=$(date "+%Y-%m-%d %H:%M")
  echo "$Date $Message"
}

# 셸 스크립트가 실행 중인 호스트명 출력
print_msg "This shell run on $HOSTNAME"

# 외부로부터 사용자 ID를 입력받음
userid=$1

# 사용자 ID를 입력받았는지 확인
if [[ -z $userid ]]; then
  print_msg "Please input userid"
fi

# for 문을 돌면서 서버별 사용자 ID 추가
for server in $Servers
do
  print_msg "User Add $userid at $server"
  
  if [[ $server == "node3" ]]; then
     ssh devopscat@node3 "sudo useradd $userid"
  else
    ssh root@$server "useradd $userid"
  fi
done  
