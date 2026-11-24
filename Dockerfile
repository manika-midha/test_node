# the purpose of a Dockerfile is to create an image based on the instructions in this file.
# following code is instructions for the image. 
# Code will tell Docker - create an image from this code and from this image, create a container.

# A Docker image contains all the necessary information to create containers with the same settings, 
# environments, and versions across different systems, ensuring that every developer has an identical setup.

# pulled a node image and added this to our image
FROM node 

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

COPY package*.json /usr/src/app

# add all project dependencies - package.json
RUN npm install

# copy all files to the container
COPY . /usr/src/app

EXPOSE 4000

# command to run the application
CMD ["npm", "start"]