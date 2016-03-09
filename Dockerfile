# Dockerfile
# using debian:jessie for it's smaller size over ubuntu
FROM nodesource/node:4.0

# Add our package.json and install *before* adding our application files
ADD package.json ./
RUN npm i --production

# Install pm2 so we can run our application
RUN npm i -g pm2

# Add application files
ADD . .

#Expose the port
EXPOSE 4500

CMD ["pm2", "start", "processes.json", "--no-daemon"]

# voila!
