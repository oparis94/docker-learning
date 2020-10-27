FROM node:14-stretch-slim as step1_build
WORKDIR /app
COPY . /app
RUN npm install && npm run build

FROM nginx:latest
COPY --from=step1_build /app/build /usr/share/nginx/html
