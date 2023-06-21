#!/usr/bin/env bash
set -ex

echo "Navicat installation"

mkdir /opt/Navicat15

wget -q http://bt.nriet.xyz/down/yhtrxHxQj7AK.AppImage -O /opt/Navicat15/navicat15-premium-cs-pathed.AppImage
chmod -R +x /opt/Navicat15/navicat15-premium-cs-pathed.AppImage


ECLIPSE_ICON="/opt/Navicat15/navicat.png"

cp $INST_SCRIPTS/navicat/navicat.png /opt/Navicat15/navicat.png

sed -i "s#navicat.png#${ECLIPSE_ICON}#" $INST_SCRIPTS/navicat/navicat.desktop

cp $INST_SCRIPTS/navicat/navicat.desktop $HOME/Desktop/
cp $INST_SCRIPTS/navicat/navicat.desktop /usr/share/applications/


#断网后填入生成的注册码，超时后选择手动激活，输入请求码，两次回车生成激活码，填入后即可激活成功。
#navicat-keygen --text ./RegPrivateKey.pem 