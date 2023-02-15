# Common build stage
FROM node:14.14.0-alpine3.12 as common-build-stage

RUN addgroup app && adduser -S -G app app

RUN mkdir /app && chown app:app /app

USER app

COPY . ./app

WORKDIR /app

RUN npm install

EXPOSE 3000

# Development build stage
FROM common-build-stage as development-build-stage

ENV NODE_ENV development

CMD ["npm", "run", "dev"]

# Production build stage
FROM common-build-stage as production-build-stage

ENV NODE_ENV production

CMD ["npm", "run", "start"]
