FROM node:16-alpine AS builder

WORKDIR /api

COPY api/package*.json ./

RUN npm install 

COPY api/ ./

FROM node:16-alpine 

WORKDIR /api

COPY --from=builder /api/node_modules ./node_modules
COPY --from=builder /api/package.json ./package.json 
COPY --from=builder /api/index.js ./index.js

EXPOSE 80

ENV NODE_ENV=production

CMD ["npm","start"]