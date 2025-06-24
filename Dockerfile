FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

# Copy prisma schema before generating
COPY prisma ./prisma/
RUN npx prisma generate

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
