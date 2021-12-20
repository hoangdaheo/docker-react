FROM node:alpine AS builder

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80/tcp
EXPOSE 80/udp
COPY --from=builder /app/build /usr/share/nginx/html