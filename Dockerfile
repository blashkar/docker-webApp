# Base Image
FROM node:alpine as builder

# work directory inside docker
WORKDIR /usr/app

# Copy required file for installing dependencies
COPY ./package.json ./
# install dependencies
RUN npm install

# copy other files
COPY ./ ./

# Startup command
# CMD [ "npm","run","build" ]
RUN npm run build

##############################

FROM nginx
EXPOSE 80

COPY --from=builder /usr/app/build /usr/share/nginx/html






