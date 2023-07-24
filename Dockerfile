##BUILD 

# pull official base image
FROM node:18-alpine
WORKDIR /app
COPY . .
COPY package.json ./
COPY package-lock.json ./
RUN npm install 

# start app react ok
CMD ["npm", "start"]

###########################################
##PRODUCTION
# pull official base image
FROM node:18-alpine as builder
# set working directory
WORKDIR /app
COPY package.json .

RUN npm install 
# add app
COPY . .

RUN npm run build  

# install app dependencies
FROM nginx:alpine

COPY  --from=builder app/build /usr/share/nginx/html