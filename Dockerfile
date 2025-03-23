# # layers in dockerfile
# # under this 6 layer till line 4,7,10,14,15,16
# # base image
# FROM  node:20 

# # working directory
# WORKDIR /app

# # copy every files
# COPY . .


# # run command to build the code
# RUN npm install
# RUN npm run build
# RUN npx prisma generate

# # ENV DATABASE_URL ="URL" THATS NOTACCEPTALE LEKIN OF DATA VISIVLE TO OTHER WHILEL USING THIS IMAGE

# # expost port
# EXPOSE 3000

# # final command run when running the container
# CMD ["node", "dist/index.js"]

# ////////////////////////////********************************?????????????????
# how does this can be optimise it means more layer should  be cached.
# how often does in a project does depandecncy got changes,how odtern does npm istatll layer does changes => it will be good that we cache npm i  step considered depandecua dors not changed.

FROM  node:20 

# working directory
WORKDIR /app
# COPY package* SAME AS BELOW LINE
COPY package.json package-lock.json ./


# run command to build the code
RUN npm install
# RUN npx prisma generate


COPY . .


RUN npm run build

# ENV DATABASE_URL ="URL" THATS NOTACCEPTALE LEKIN OF DATA VISIVLE TO OTHER WHILEL USING THIS IMAGE

# expost port
EXPOSE 3000

# final command run when running the container
CMD ["node", "dist/index.js"]
