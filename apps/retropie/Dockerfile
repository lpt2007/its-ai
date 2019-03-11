FROM raspbian/stretch

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ca-certificates git lsb-release
    && useradd -d /home/retropie -G sudo -m pi \
    && echo "pi ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/pi

WORKDIR /home/retropie

USER pi

RUN git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git \
    && cd RetroPie-Setup \
    && sudo chmod +x retropie_setup.sh \
    && sudo ./retropie_packages.sh setup basic_install \
    && sudo rm -rf /var/lib/apt/lists/* && sudo chown -R pi /home/retropie
    
RUN wget downloads.eltechs.com/install-exagear-retropie-v2.sh \
    && sudo chmod +x install-exagear-retropie-v2.sh \
    && sudo ./install-exagear-retropie-v2.sh \

RUN sudo usermod -aG adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input

ENTRYPOINT "/usr/bin/emulationstation"

CMD "#auto"
