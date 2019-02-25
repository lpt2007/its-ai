FROM raspbian/stretch

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apparmor-utils apt-transport-https avahi-daemon ca-certificates curl dbus jq network-manager socat software-properties-common \
    && useradd -d /home/pi/hassio -G sudo -m pi \
    && echo "pi ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/pi

WORKDIR /home/pi/hassio

USER pi
    
RUN curl -sL "https://raw.githubusercontent.com/home-assistant/hassio-build/master/install/hassio_install" | bash -s

RUN sudo usermod -aG adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,inp$

#ENTRYPOINT "/usr/bin/emulationstation"

#CMD "#auto"
