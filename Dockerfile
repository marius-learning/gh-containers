FROM node:16-alpine

ARG PORT=3000
ENV PORT=$PORT

ARG MONGODB_DB_NAME
ENV MONGODB_DB_NAME=$MONGODB_DB_NAME

ARG MONGODB_USERNAME
ENV MONGODB_USERNAME=$MONGODB_USERNAME

ARG MONGODB_PASSWORD
ENV MONGODB_PASSWORD=$MONGODB_PASSWORD

ARG MONGODB_CLUSTER_ADDRESS
ENV MONGODB_CLUSTER_ADDRESS=$MONGODB_CLUSTER_ADDRESS

ARG MONGODB_CONNECTION_PROTOCOL=mongodb+srv
ENV MONGODB_CONNECTION_PROTOCOL=$MONGODB_CONNECTION_PROTOCOL

ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY --chown=node:node package*.json .

RUN npm ci

COPY --chown=node:node . .

USER node

CMD ["node", "app.js"]

EXPOSE $PORT