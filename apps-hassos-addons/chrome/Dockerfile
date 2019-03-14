FROM raspbian/stretch
LABEL maintainer "Alex T. <info@leal.si>"

# Install Chromium
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y \
      chromium-browser \
      libraspberrypi0 \
      libraspberrypi-dev \
      libraspberrypi-doc \
      lsb-release \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/chromium.d/ \
    && /bin/echo -e 'export GOOGLE_API_KEY="AIzaSyCkfPOPZXDKNn8hhgu3JrA62wIgC93d44k"\nexport GOOGLE_DEFAULT_CLIENT_ID="811574891467.apps.googleusercontent.com"\nexport GOOGLE_DEFAULT_CLIENT_SECRET="kdloedMFGdGla2P1zacGjAQh"' > /etc/chromium.d/googleapikeys

# Install X11 minimum
RUN apt-get install -y \
      xserver-xorg \
      xinit \
      matchbox-window-manager

# Add chromium user
RUN groupadd -r chromium && useradd -r -g chromium -G audio,video chromium \
    && mkdir -p /home/chromium/Downloads && chown -R chromium:chromium /home/chromium
    
# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Run as non privileged user
#USER chromium

CMD [ "/run.sh" ]
