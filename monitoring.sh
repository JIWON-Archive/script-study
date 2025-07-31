#!/bin/bash
#서버 상태 확인 스크립트

# CPU 사용률확인
echo "CPU 사용률:"
top -bn1 | grep "Cpu(s)"

# 메모리 사용량확인
echo "메모리 사용량:"
free -h

# 디스크 사용량확인
echo "디스크 사용량:"
df -h
