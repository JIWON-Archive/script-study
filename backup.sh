#!/bin/bash
# 백업할 디렉토리 경로 설정
SOURCE_DIR="/home/devopscat/documents"
BACKUP_DIR="/home/devopscat/backup"

# 백업 디렉토리 생성
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p $BACKUP_DIR
fi
# 데이터 저장할 디렉토리 생성
if [ ! -d "$SOURCE_DIR" ]; then
    mkdir -p $SOURCE_DIR
fi

# 백업할 데이터 생성
BACKUP_DATA="/home/devopscat/documents/backupTest.txt"
cat << EOF > /home/devopscat/documents/backupTest.txt
백업 테스트
EOF

# 현재 날짜를 기준으로 백업 파일 이름 생성
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# tar 명령어를 사용해 디렉토리를 압축하고 백업
tar -czf $BACKUP_FILE $SOURCE_DIR

# 백업 완료 메시지 출력
echo "백업이 완료되었습니다: $BACKUP_FILE"
