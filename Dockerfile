# SID - Sample App Dockerfile
FROM ubuntu:latest
MAINTAINER Christoph Meier <meier.c@sfeir.lu>

# Install node.js
RUN apt-get update
RUN apt-get install -y python-software-properties python g++ make
RUN apt-get update
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs

# Set working directory for execution
WORKDIR /app/express

# Add app config
ADD package.json /app/express/package.json

# Install app dependencies (express)
RUN npm install	

# Add app files
ADD app.js /app/express/app.js

# Expose port to host
EXPOSE 8888

# Run app with node
CMD ["node", "app"]