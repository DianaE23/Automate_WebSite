
#FROM node:18-alpine
#WORKDIR /app
#COPY . .
#COPY package.json ./
#COPY package-lock.json ./
#RUN npm install 
#CMD ["npm", "start"]
########################################4###


#STAGE 1 BUILD IMAGE 

FROM node:18-alpine as builder
WORKDIR /app
COPY package.json .
COPY package-lock.json ./
RUN npm install 
COPY . .
RUN npm run build  

#STAGE WEB SERVER NGINX  copy the content 1 on 2 

FROM nginx:alpine
WORKDIR /usr/share/nginx/html 
RUN rm -rf ./*
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build .
ENTRYPOINT [ "nginx","-g","daemon off;" ]


