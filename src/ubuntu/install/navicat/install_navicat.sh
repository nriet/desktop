#!/usr/bin/env bash
set -ex
cp navicat.desktop /usr/share/applications/navicat.desktop
mkdir /opt/Navicat15
cp navicat.png /opt/Navicat15/navicat.png
wget -q http://bt.nriet.xyz/down/yhtrxHxQj7AK.AppImage -O /opt/Navicat15/navicat15-premium-cs-pathed.AppImage
chmod -R +x /opt/Navicat15/navicat15-premium-cs-pathed.AppImage
#断网后填入生成的注册码，超时后选择手动激活，输入请求码，两次回车生成激活码，填入后即可激活成功。
#navicat-keygen --text ./RegPrivateKey.pem 