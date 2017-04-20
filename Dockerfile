FROM node:alpine

WORKDIR /usr/src/buckless-client

EXPOSE 8081

CMD ["yarn", "dev"]

RUN apk update && \
    apk add --no-cache git openssh make gcc g++ python pcsc-lite-dev && \
    mkdir -p /usr/src/buckless-client

COPY package.json /usr/src/buckless-client/
COPY yarn.lock /usr/src/buckless-client/

RUN yarn global add node-gyp
RUN yarn install

COPY . /usr/src/buckless-client/
