FROM nmaas87/docker-raspbian_qemu:latest
MAINTAINER Nico Maas <mail@nico-maas.de>
ENV DEBIAN_FRONTEND noninteractive
#RUN [ "cross-build-start" ]

# Install basic system with gui
RUN apt-get update \
    && apt-get install -yq --no-install-recommends \
        apt-utils \
        openssh-server \
        libraspberrypi0 \
        xinput \
        evtest \
        evemu-tools \
        libnss3 \
        xinput-calibrator \
        xorg \
        xserver-xorg-core \
        xserver-xorg-input-evdev \
        matchbox \
        alsa-utils \
        libasound2 \
        sudo \
        whois \
        locales \
        xterm \
    && apt-get autoremove -qqy \
    && apt-get autoclean -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/* && mkdir /var/lib/apt/lists/partial \
    && mkdir /var/run/sshd \
    && echo 'root:resin' | chpasswd \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Generate Locales
RUN touch /usr/share/locale/locale.alias \
  && sed -i "s/^#\ \+\(de_DE.UTF-8\)/\1/" /etc/locale.gen \
  && locale-gen de_DE de_DE.UTF-8
ENV LANG de_DE.UTF-8 \
  LC_ALL de_DE.UTF-8 \
  LANGUAGE de_DE:de

# Add User pi
RUN useradd \
  --groups=sudo \
  --create-home \
  --home-dir=/home/pi \
  --shell=/bin/bash \
  --password=$(mkpasswd pi) \
  pi \
  && sed -i '/%sudo[[:space:]]/ s/ALL[[:space:]]*$/NOPASSWD:ALL/' /etc/sudoers

RUN apt-get update \
    && apt-get install -y \
        kodi \
        fbset

# copy tools fbcp and raspi2fb
COPY tools/* /usr/local/bin/
RUN chmod +x /usr/local/bin/fbcp && chmod +x /usr/local/bin/raspi2fb

# copy program
RUN mkdir -p /usr/src/app && ln -s /usr/src/app /app
WORKDIR /usr/src/app
COPY src /usr/src/app

# copy service file, enable own service, disable resin launch service
COPY src/xinit-docker.service /lib/systemd/system/xinit-docker.service
RUN systemctl enable xinit-docker.service
RUN systemctl disable launch.service

# start init system
ENV INITSYSTEM on
