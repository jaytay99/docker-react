FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
# EXPOSE 80  # Commented out so that builds cannot succeed to AWS and start up
COPY --from=0 /app/build /usr/share/nginx/html