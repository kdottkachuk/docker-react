FROM node:16-alpine3.11
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.20.1-alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html