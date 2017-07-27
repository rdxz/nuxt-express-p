FROM node:7.8.0-alpine
MAINTAINER Shudoong
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
RUN apk update && apk upgrade && apk add git

COPY . /usr/src/app/

RUN npm config set registry https://registry.npm.taobao.org

RUN npm install

# Build app
RUN npm run build

ENV HOST 0.0.0.0
EXPOSE 3000

# start command
CMD [ "npm", "start" ]




