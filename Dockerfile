FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3000

RUN addgroup -S testapp && adduser -S testapp -G testapp

USER testapp

CMD ["npm", "start"]