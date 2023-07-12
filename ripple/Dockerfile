# 베이스 이미지를 선택
FROM node:16.13.0

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

# node의 포트는 19006, 19001 and 19002 포트는 디버깅용으로 개방
ARG PORT=19006
ENV PORT $PORT
EXPOSE $PORT 19000 19002

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH /home/node/.npm-global/bin:$PATH
RUN npm i --unsafe-perm --allow-root -g npm@latest expo-cli@latest react-native-web@~0.18.10 react-dom@18.2.0 @expo/webpack-config@^18.0.1


# install dependencies first, in a different location for easier app bind mounting for local development
# due to default /opt permissions we have to create the dir with root and change perms
RUN mkdir /opt/react_native_app
WORKDIR /opt/react_native_app
ENV PATH /opt/react_native_app/.bin:$PATH
COPY ./package.json ./package-lock.json ./
RUN npm install

# copy in our source code last, as it changes the most
WORKDIR /opt/ripple/app
# for development, we bind mount volumes; comment out for production
COPY ./ .

ENTRYPOINT ["npm", "run"]
CMD ["web"]