#!/usr/bin/env bash
set -ex
#apt-get update
# pt-get install -y g++ \
#                    libcapstone-dev \
#                    cmake \
#                    rapidjson-dev
# cd /dockerstartup/install/navicat
# wget -q http://download.navicat.com.cn/download/navicat15-premium-cs.AppImage -O /home/kasm-default-profile/navicat15-premium-cs.AppImage

# it clone http://github.com/keystone-engine/keystone.git
# cd keystone
# mkdir build
# cd build
# ../make-share.sh
# make install
# ldconfig
# mkdir navicat15
#mount -o loop navicat15-premium-cs.AppImage navicat15
#cp -r navicat15 navicat15-patched
#./navicat-patcher navicat15-patched
#./appimagetool-x86_64.AppImage navicat15-patched navicat15-premium-cs-pathed.AppImage
#chmod +x navicat15-premium-cs-pathed.AppImage




# Cleanup
# t-get autoclean
# rm -rf \
#     /var/lib/apt/lists/* \
#     /var/tmp/* \
#     /tmp/*

RUN wget -q http://bt.nriet.xyz/down/hIZGn4yYWTFP.gz -O /opt/Navicat15.tar.gz \
    && cd /opt \
    && tar zxvf Navicat15.tar.gz  \
    && cp /opt/Navicat15/navicat.desktop /usr/share/applications/navicat.desktop \
    && chmod -R +x /opt/Navicat15/* \
    && rm -rf /opt/Navicat15.tar.gz