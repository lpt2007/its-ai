FROM raspbian/stretch
LABEL maintainer "Alex T. <info@leal.si>"

# Install Chromium
RUN apt-get update && apt-get install -y \
      chromium-browser \
      libraspberrypi0 \
      libraspberrypi-dev \
      libraspberrypi-doc \
      lsb-release \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/chromium.d/ \
    && /bin/echo -e 'export GOOGLE_API_KEY="AIzaSyCkfPOPZXDKNn8hhgu3JrA62wIgC93d44k"\nexport GOOGLE_DEFAULT_CLIENT_ID="811574891467.apps.googleusercontent.com"\nexport GOOGLE_DEFAULT_CLIENT_SECRET="kdloedMFGdGla2P1zacGjAQh"' > /etc/chromium.d/googleapikeys

# Add chromium user
RUN groupadd -r chromium && useradd -r -g chromium -G audio,video chromium \
    && mkdir -p /home/chromium/Downloads && chown -R chromium:chromium /home/chromium
    
# Run as non privileged user
USER chromium

ENTRYPOINT [ "/usr/bin/chromium-browser" ]
CMD [ "--user-data-dir=/data" ]
