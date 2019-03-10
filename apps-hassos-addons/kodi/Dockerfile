FROM raspbian/stretch
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y fbset libraspberrypi0 kodi vlc
RUN apt-get install -y git build-essential cmake

RUN git clone http://github.com/raspberrypi/userland ~/tmp/userland && cd ~/tmp/userland && ./buildme && rm -r ~/tmp/userland && sudo ln -s /opt/vc/bin/tvservice /usr/bin/tvservice

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
