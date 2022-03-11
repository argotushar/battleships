# Container image that runs your code
FROM node:15.14-alpine3.13

FROM node:12.18.1
ENV NODE_ENV=production
ENV PORT=80

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

# RUN --mount=type=secret,id=MY_SECRET_FILE,dst=/etc/secrets/.env cat /etc/secrets/.env
# RUN --mount=type=secret,id=MY_SECRET_FILE cat /run/secrets/MY_SECRET_FILE; ab=`cat /run/secrets/MY_SECRET_FILE`; echo ${#ab}
# RUN --mount=type=secret,id=MY_GITHUB_SECRET_FILE cat /run/secrets/MY_GITHUB_SECRET_FILE

RUN npm install --production

COPY . .

EXPOSE 80

CMD [ "node", "server.js" ]
