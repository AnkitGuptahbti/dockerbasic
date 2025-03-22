# layers in dockerfile
# under this 6 layer till line 4,7,10,14,15,16
# base image
FROM  node:20 

# working directory
WORKDIR /app

# copy every files
COPY . .


# run command to build the code
RUN npm install
RUN npm run build
RUN npx prisma generate

# ENV DATABASE_URL ="URL" THATS NOTACCEPTALE LEKIN OF DATA VISIVLE TO OTHER WHILEL USING THIS IMAGE

# expost port
EXPOSE 3000

# final command run when running the container
CMD ["node", "dist/index.js"]



