FROM node:16-alpine as builder

WORKDIR /api

copy api/package*.json ./

RUN npm install 

COPY api/ ./

FROM node:16-alpine 

WORKDIR /api

copy --from=builder /api/node_modules ./node_modules
copy --from=builder /api/package.json ./package.json 
copy --from=builder /api/index.js ./index.js

EXPOSE 3000

ENV NODE_ENV=production

CMD ["npm","start"]