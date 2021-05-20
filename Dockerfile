# Build Phase 

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- all the stuff will be here after above.

# Run phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# default command to run nginx is Ok , 
# nothing special to run
