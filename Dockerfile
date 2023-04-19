FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm install pm2 -g

CMD ["pm2-runtime", "index.js"]

