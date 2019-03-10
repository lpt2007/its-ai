FROM raspbian/stretch
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y fbset libraspberrypi0 kodi vlc

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
