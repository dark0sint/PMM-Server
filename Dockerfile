FROM node:22-slim
WORKDIR /app
COPY package.json ./
RUN npm install --omit=dev
COPY . .
ENV NODE_ENV=production DB_FILE=/data/pmm.db
VOLUME /data
EXPOSE 3000
CMD ["node","server.js"]
