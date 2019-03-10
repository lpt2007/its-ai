cd /tmp
git clone http://github.com/raspberrypi/userland
cd userland
./buildme

ln -s /config/docker/kodi/.kodi  /root/.kodi

kodi
