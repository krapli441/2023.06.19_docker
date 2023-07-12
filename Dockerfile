# 베이스 이미지를 선택
FROM node:18.16.1

# 작업 디렉토리 설정
WORKDIR /app

# 앱 종속성을 설치
COPY package*.json ./
RUN npm install

# 리액트 네이티브 CLI 설치
RUN npm install -g react-native-cli

RUN apt-get update
RUN apt-get install -y openjdk-11-jdk

# Java 설치
# RUN apt-get update && \
#     apt-get install -y openjdk-11-jdk

#     # Android SDK 설치
# RUN apt-get install -y curl unzip && \
#     curl -o sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip && \
#     unzip sdk-tools.zip -d android-sdk && \
#     rm sdk-tools.zip && \
#     yes | android-sdk/cmdline-tools/bin/sdkmanager --licenses && \
#     android-sdk/cmdline-tools/bin/sdkmanager "platforms;android-30" "build-tools;30.0.3"

# 앱 소스 코드 복사
COPY . .

# 포트 매핑
EXPOSE 3000