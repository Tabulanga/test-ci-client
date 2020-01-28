### STAGE 1: Build ###
FROM node:8-stretch as build

# Create app directory
WORKDIR /home/node/app

# Install app dependencies
COPY package.json .

RUN npm install

# Bundle app source
COPY . .

RUN npm run build

### STAGE 2: Setup ###
FROM nginx:1.15.12-alpine
# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*
# From 'builder' stage copy over the artifacts in dist folder to default nginx public folder
COPY --from=build /home/node/app/dist /usr/share/nginx/html