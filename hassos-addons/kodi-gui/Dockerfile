FROM resin/rpi-raspbian:jessie

# Enable building ARM container on x86 machinery on the web (comment out next line if built on Raspberry)
RUN [ "cross-build-start" ]

RUN apt-get clean && apt-get update && apt-get install wget -y

RUN echo 'deb http://pipplware.pplware.pt/pipplware/dists/jessie/main/binary /' >> /etc/apt/sources.list && \
    wget -O - http://pipplware.pplware.pt/pipplware/key.asc | sudo apt-key add - && \
    apt-get update && apt-get dist-upgrade -y

RUN apt-get clean && apt-get update && apt-get install -y --no-install-recommends xserver-xorg xinit \
     fbset libraspberrypi0 alsa-base alsa-utils alsa-tools kodi xserver-xorg-legacy dbus-x11 \
     && apt-get clean && rm -rf /var/lib/apt/lists/*

# Uncomment if you want to install recommanded PVR addons
RUN apt-get update && apt-get install -y kodi-pvr-mythtv kodi-pvr-vuplus kodi-pvr-vdr-vnsi kodi-pvr-njoy \
 kodi-pvr-nextpvr kodi-pvr-mediaportal-tvserver kodi-pvr-tvheadend-hts \
 kodi-pvr-dvbviewer kodi-pvr-argustv kodi-pvr-iptvsimple \
 && apt-get clean && rm -rf /var/lib/apt/lists/*
 
# Enable tvservice
RUN apt-get update && apt-get install git build-essential cmake -y

RUN cd /tmp && git clone http://github.com/raspberrypi/userland && sed -i 's/set(INSTALL_TARGETS "${INSTALL_TARGETS} vcilcs")/set(INSTALL_TARGETS ${INSTALL_TARGETS} vcilcs)/g' /tmp/userland/interface/vmcs_host/CMakeLists.txt && cd userland && ./buildme

RUN ln -s /opt/vc/bin/tvservice /usr/bin/tvservice

 
# Configure Kodi group
RUN usermod -a -G audio root && \
usermod -a -G video root && \
usermod -a -G input root && \
usermod -a -G dialout root && \
usermod -a -G plugdev root && \
usermod -a -G tty root

# Needed configurations files
COPY "./files/Xwrapper.config" "/etc/X11"
COPY "./files/10-permissions.rules" "/etc/udev/rules.d"
COPY "./files/99-input.rules" "/etc/udev/rules.d"
# Uncomment if you want to enable webserver and remote control settings by default
COPY "./files/settings.xml" "/usr/share/kodi/system/settings"

# Kodi directories
#RUN  mkdir -p /config/kodi/userdata >/dev/null 2>&1 || true && rm -rf /root/.kodi && ln -s /config/kodi /root/.kodi \
#    && mkdir -p /data >/dev/null 2>&1
RUN  mkdir -p /share/kodi-gui/data >/dev/null 2>&1 || true && rm -rf /root/.kodi && ln -s /share/kodi-gui/data /root/.kodi \
    && mkdir -p /data >/dev/null 2>&1

# ports and volumes
#VOLUME /config/kodi
#VOLUME /data
EXPOSE 8080 9777/udp

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

#CMD ["bash", "/usr/bin/kodi"]

# stop processing ARM emulation (comment out next line if built on Raspberry)
RUN [ "cross-build-end" ]
