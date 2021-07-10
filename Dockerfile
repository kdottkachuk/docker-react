FROM node:16-alpine3.11 AS build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.20.1-alpine
COPY --from=build /app/build /usr/share/nginx/html