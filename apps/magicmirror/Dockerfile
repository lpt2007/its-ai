FROM hypriot/rpi-node:latest

ENV NODE_ENV production

WORKDIR /opt/magic_mirror

RUN git clone --depth 1 -b master https://github.com/MichMich/MagicMirror.git .

RUN cp -R modules /opt/default_modules
RUN cp -R config /opt/default_config
RUN npm install --unsafe-perm --silent

COPY docker-entrypoint.sh /opt
RUN apt-get update \
  && apt-get -qy install dos2unix \
  && dos2unix /opt/docker-entrypoint.sh \
  && chmod +x /opt/docker-entrypoint.sh

RUN apt-get -y install libgtk-3-0
RUN apt-get -y install libx11-xcb-dev
RUN apt-get -y install libxtst6
RUN apt-get -y install libxss1
RUN apt-get -y install libgconf-2-4
RUN apt-get -y install libnss3
RUN apt-get -y install libasound2

EXPOSE 8080
CMD ["npm start"]
ENTRYPOINT ["/opt/docker-entrypoint.sh"]
