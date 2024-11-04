
FROM node:20
WORKDIR package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm","start"]

