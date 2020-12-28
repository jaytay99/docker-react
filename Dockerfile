FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
<<<<<<< HEAD
#EXPOSE 80
=======
# EXPOSE 80  # Commented out so that builds cannot succeed to AWS and start up
>>>>>>> e8b48b717a89bc8ff430418ac8bd1e789efb87ec
COPY --from=0 /app/build /usr/share/nginx/html