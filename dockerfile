# Python 3.9 slim 베이스 이미지 사용
FROM python:3.9-slim

# 필요한 시스템 패키지 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    libmariadb-dev \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /app

# 로컬의 모든 파일을 컨테이너의 /app 디렉토리로 복사
COPY . /app

# 필요한 패키지 설치
RUN pip install --no-cache-dir jupyter mariadb nbconvert

# Jupyter Notebook 파일 실행
CMD ["jupyter", "nbconvert", "--to", "notebook", "--execute", "--inplace", "/app/donggukReview.ipynb"]
