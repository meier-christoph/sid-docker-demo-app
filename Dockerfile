# SID - Sample App Dockerfile
FROM ubuntu:latest
MAINTAINER Christoph Meier <meier.c@sfeir.lu>

# Install node.js
RUN apt-get update \
	&& apt-get install -y python-software-properties python g++ make software-properties-common \
	&& add-apt-repository ppa:chris-lea/node.js \
	&& apt-get update \
	&& apt-get install -y nodejs

# Install node dependencies (with cache)
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/

# Set working directory for execution
WORKDIR /opt/app

# Add app files
ADD . /opt/app

# Expose port to host
EXPOSE 8888

# Run app.js with node
CMD ["node", "app.js"]
