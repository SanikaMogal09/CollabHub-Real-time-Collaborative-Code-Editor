# # (nodejs + os(linux))
# COPY ./Backend .
# RUN npm install
# CMD [ "node", "server.js" ]

# ================================================= #

# build the Frontend [dist foldder]
# copy the dist folder content in the Backend/public folder

FROM node:20-alpine as frontend-builder

COPY ./Frontend /app

WORKDIR /app

RUN npm install

RUN npm run build

# build the backend

FROM node:20-alpine

COPY ./Backend /app

WORKDIR /app

RUN npm install

COPY --from=frontend-builder /app/dist /app/public

CMD [ "node", "server.js" ]





