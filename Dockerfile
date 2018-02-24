FROM node:8

EXPOSE 8080

ENV \
  # Where the app is built and run inside the docker fs \
  WORK=/opt/digitransit-ui/app \
  # Used indirectly for saving npm logs etc. \
  HOME=/opt/digitransit-ui/logs \
  # App specific settings to override when the image is run \
  SENTRY_DSN='' \
  SENTRY_SECRET_DSN='' \
  PORT=8080 \
  API_URL='' \
  MAP_URL='' \
  APP_PATH='' \
  CONFIG='' \
  PIWIK_ADDRESS='' \
  PIWIK_ID='' \
  NODE_ENV='' \
  NODE_OPTS='' \
  RELAY_FETCH_TIMEOUT=''

# Checkout fork of digitransit-ui
RUN git clone https://github.com/mapanica/digitransit-ui.git ${WORK}

WORKDIR ${WORK}
ADD . ${WORK}

RUN \
  yarn install --silent && \
  yarn add --force node-sass

CMD yarn run dev

#RUN \
#  yarn install --silent && \
#  yarn add --force node-sass && \
#  yarn run build && \
#  rm -rf static docs test /tmp/* && \
#  yarn cache clean
#
#CMD yarn run start
