FROM raspbian/stretch
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y libraspberrypi0 libraspberrypi-dev libraspberrypi-doc
RUN apt-get install -y lsb-release
RUN apt-get install chromium-browser -y

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
