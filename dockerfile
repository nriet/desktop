ARG BASE_TAG="develop"
ARG BASE_IMAGE="core-ubuntu-focal"
FROM kasmweb/$BASE_IMAGE:$BASE_TAG
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install

ENV TIME_ZONE Asia/Shanghai
 
WORKDIR $HOME

######### Customize Container Here ###########

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y tzdata \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get clean \
    && rm -rf /tmp/* /var/cache/* /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/*

# Add Kasm Branding
#RUN cp /usr/share/extra/backgrounds/bg_kasm.png /usr/share/extra/backgrounds/bg_default.png
#RUN cp /usr/share/extra/icons/icon_kasm.png /usr/share/extra/icons/icon_default.png
#RUN sed -i 's/ubuntu-mono-dark/elementary-xfce/g' $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml

# Install Utilities
#COPY ./ubuntu/install/misc $INST_SCRIPTS/misc/
#RUN bash $INST_SCRIPTS/misc/install_tools.sh && rm -rf $INST_SCRIPTS/misc/

# Install Google Chrome
COPY ./ubuntu/install/chrome $INST_SCRIPTS/chrome/
RUN bash $INST_SCRIPTS/chrome/install_chrome.sh  && rm -rf $INST_SCRIPTS/chrome/

# Install Firefox
#COPY ./ubuntu/install/firefox/ $INST_SCRIPTS/firefox/
#COPY ./ubuntu/install/firefox/firefox.desktop $HOME/Desktop/
#RUN bash $INST_SCRIPTS/firefox/install_firefox.sh && rm -rf $INST_SCRIPTS/firefox/

# Install Custom Certificate Authority
# COPY ./ubuntu/install/certificates $INST_SCRIPTS/certificates/
# RUN bash $INST_SCRIPTS/certificates/install_ca_cert.sh && rm -rf $INST_SCRIPTS/certificates/


# Install vs-code
# COPY ./ubuntu/install/vs_code $INST_SCRIPTS/vs_code/
# RUN bash $INST_SCRIPTS/vs_code/install_vs_code.sh  && rm -rf $INST_SCRIPTS/vs_code/
# COPY ./ubuntu/install/vs_code/custom_startup.sh $STARTUPDIR/custom_startup.sh
# RUN chmod +x $STARTUPDIR/custom_startup.sh
# RUN chmod 755 $STARTUPDIR/custom_startup.sh


# Install nodejs
# RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
# 	&& apt-get install -y nodejs

# Install finalshell
# RUN bash rm -f finalshell_install_linux.sh ;\
# 	&& wget www.hostbuf.com/downloads/finalshell_install_linux.sh; \
# 	&& chmod +x finalshell_install_linux.sh; \
# 	&& ./finalshell_install_linux.sh; \
# 	&& chmod +x /usr/lib/FinalShell/bin/FinalShell;

# Install anavicat
COPY ./ubuntu/install/navicat $INST_SCRIPTS/navicat/
RUN bash $INST_SCRIPTS/navicat/install_vs_navicat.sh 

######### End Customizations ###########

USER root