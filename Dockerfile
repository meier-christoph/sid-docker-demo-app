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

# Add sample application
ADD app.js /app/express/app.js
ADD package.json /app/express/package.json

# Set working directory for execution
WORKDIR /app/express

# Install app dependencies (express)
RUN npm install	

# Expose port to host
EXPOSE 8888

# Run app with node
CMD ["node", "app"]