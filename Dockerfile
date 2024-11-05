# Node Base Image
FROM node:20

#Working Directry
WORKDIR /app

#Copy the Code
COPY . .

#Install the dependecies
RUN npm install

EXPOSE 3000

#Run the code
CMD ["npm,"start"]
