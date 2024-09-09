FROM node:carbon-alpine

RUN npm install -g --unsafe @bioinformatics-cdac/icetunnel \
 && npm cache --force clean

ENV NODE_PATH=/usr/local/lib/node_modules

WORKDIR /usr/bin/

EXPOSE 8080

ENTRYPOINT ["icetunnel", "-r", "-s", "8080", "--ssl=false"]



