
ARG NODE_VERSION=22.14.0

FROM node:${NODE_VERSION}-alpine

WORKDIR /app

COPY package.json package-lock.json* ./

RUN npm ci --omit=dev

COPY . .

USER node

EXPOSE 3000

ENV NODE_ENV=production

# Run the application.
CMD ["npm", "start"]
