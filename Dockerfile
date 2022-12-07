FROM          node
RUN           useradd roboshop
RUN           mkdir -p /app
RUN           chown roboshop:roboshop /app
WORKDIR       /app
USER          roboshop
ENTRYPOINT    ["node", "server.js"]
EXPOSE        8080
### THese steps might change
COPY          server.js /app/server.js
COPY          node_modules/ /app/node_modules/
ADD  --chown=roboshop:roboshop         https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem /app/rds-combined-ca-bundle.pem
