# pull official base image
FROM node:18.16.1-debian

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH


# add app
COPY . .

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install 

# start app
CMD ["npm", "start"]