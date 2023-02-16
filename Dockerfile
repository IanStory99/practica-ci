# Common build stage
FROM node:14.14.0-alpine3.12 as common-build-stage

COPY . ./app

WORKDIR /app

ENV PORT 3000
ENV SECRET_KEY secretKey
ENV LOG_FORMAT dev
ENV LOG_DIR ../logs
ENV ORIGIN *
ENV CREDENTIALS true

RUN npm install

RUN chmod -R 775 /app

EXPOSE 3000

# Development build stage
FROM common-build-stage as development-build-stage

ENV NODE_ENV development

CMD ["npm", "run", "dev"]

# Production build stage
FROM common-build-stage as production-build-stage

ENV NODE_ENV production

CMD ["npm", "run", "start"]
