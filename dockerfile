FROM node:16-alpine AS builder

#set the working directory in container
WORKDIR /api

#copy dependency definition files
COPY api/package*.json ./

#install dependencies
RUN npm install 

COPY api/ ./

#start fresh image to run the application
FROM node:16-alpine 

#set working image in the final image
WORKDIR /api

#copy what you need from the builder stage 
COPY --from=builder /api/node_modules ./node_modules
COPY --from=builder /api/package.json ./package.json 
COPY --from=builder /api/index.js ./index.js

#open the port for incoming requests
EXPOSE 3000

#set environment variable for production mode
ENV NODE_ENV=production

#Define the default commands
CMD ["npm","start"]