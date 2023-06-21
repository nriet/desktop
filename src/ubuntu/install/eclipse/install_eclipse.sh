#!/bin/bash

ECLIPSE_VER_DATE="2023-06"
TOMCAT_VER="8.5.90"

cd /tmp
wget -q -O eclipse.tar.gz "https://mirrors.xmission.com/eclipse/technology/epp/downloads/release/${ECLIPSE_VER_DATE}/R/eclipse-jee-${ECLIPSE_VER_DATE}-R-linux-gtk-$(arch).tar.gz"
tar -xzf eclipse.tar.gz -C /opt

ECLIPSE_ICON="/opt/eclipse/plugins/$(ls /opt/eclipse/plugins/ | grep -m 1 org.eclipse.platform_)/eclipse128.png"
sed -i "s#eclipse128.png#${ECLIPSE_ICON}#" $INST_SCRIPTS/eclipse/eclipse.desktop
cp $INST_SCRIPTS/eclipse/eclipse.desktop $HOME/Desktop/
cp $INST_SCRIPTS/eclipse/eclipse.desktop /usr/share/applications/

rm -rf /tmp/eclipse.tar.gz

wget -q -O tomcat.tar.gz "https://dlcdn.apache.org/tomcat/tomcat-8/v${TOMCAT_VER}/bin/apache-tomcat-${TOMCAT_VER}.tar.gz"
tar -xzf tomcat.tar.gz -C /opt

rm -rf /tmp/tomcat.tar.gz