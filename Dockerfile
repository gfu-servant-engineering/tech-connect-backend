FROM strapi/base

WORKDIR /my-path

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn config set network-timeout 300000 && yarn install

COPY . .

RUN yarn build

EXPOSE 1337

ENV NODE_ENV production

CMD ["yarn", "start"]
