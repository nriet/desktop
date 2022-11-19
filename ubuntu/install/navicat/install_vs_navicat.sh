#!/usr/bin/env bash
set -ex
#apt-get update
apt-get install -y g++ \
                   libcapstone-dev \
                   cmake \
                   rapidjson-dev
cd /dockerstartup/install/navicat
wget -q http://download.navicat.com.cn/download/navicat15-premium-cs.AppImage -O navicat15-premium-cs.AppImage

git clone http://github.com/keystone-engine/keystone.git
cd keystone
mkdir build
cd build
../make-share.sh
make install
ldconfig
mkdir navicat15
# mount -o loop navicat15-premium-cs.AppImage navicat15
# cp -r navicat15 navicat15-patched
# ./navicat-patcher navicat15-patched
# ./appimagetool-x86_64.AppImage navicat15-patched navicat15-premium-cs-pathed.AppImage
# chmod +x navicat15-premium-cs-pathed.AppImage




# Cleanup
apt-get autoclean
rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
