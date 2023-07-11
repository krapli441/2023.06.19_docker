# 베이스 이미지를 선택
FROM node:14

# 작업 디렉토리 설정
WORKDIR /app

# 앱 종속성을 설치
COPY package*.json ./
RUN npm install

# 리액트 네이티브 CLI 설치
RUN npm install -g react-native-cli

# 앱 소스 코드 복사
COPY . .

# 포트 매핑
EXPOSE 3000