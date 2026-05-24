FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

FROM node:20-alpine

RUN addgroup -S testapp && adduser -S testapp -G testapp

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

ENV PORT=3000

USER testapp

CMD ["npm", "start"]