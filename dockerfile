FROM accetto/xubuntu-vnc-novnc-chrome
USER root

# ENV HOME /root
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install

ENV TIME_ZONE Asia/Shanghai
 
#WORKDIR $HOME

######### Customize Container Here ###########
#设置时区
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y tzdata \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get clean \
    && rm -rf /tmp/* /var/cache/* /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/*

#设置中文字体
# COPY ./fonts /usr/share/fonts/myfonts
RUN wget -q http://bt.nriet.xyz/down/nYT9ZCTSsHoY.gz -O /usr/share/fonts/myfonts.tar.gz \
    && cd /usr/share/fonts \
    && tar zxvf myfonts.tar.gz  \
    && chmod -R 755 /usr/share/fonts/myfonts \
    && cd /usr/share/fonts/myfonts \
    && mkfontscale \
    && mkfontdir \
    && fc-cache -fv \
    && rm -rf /usr/share/fonts/myfonts.tar.gz

# Install vs-code
# COPY ./src/ubuntu/install/vs_code $INST_SCRIPTS/vs_code/
# RUN bash $INST_SCRIPTS/vs_code/install_vs_code.sh  && rm -rf $INST_SCRIPTS/vs_code/
# COPY ./src/ubuntu/install/vs_code/custom_startup.sh $STARTUPDIR/custom_startup.sh
# RUN chmod +x $STARTUPDIR/custom_startup.sh
# RUN chmod 755 $STARTUPDIR/custom_startup.sh

# Install nodejs
# RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
# 	&& apt-get install -y nodejs

# Install finalshell
RUN wget www.hostbuf.com/downloads/finalshell_install_linux.sh \
    && chmod +x finalshell_install_linux.sh \
    && ./finalshell_install_linux.sh \
    && chmod +x /usr/lib/FinalShell/bin/FinalShell \
    && rm -rf finalshell_install_linux.sh \
    && rm -rf finalshell_data_linux.zip
    

# Install anavicat 
# COPY ./src/ubuntu/install/navicat $INST_SCRIPTS/navicat/
# RUN bash $INST_SCRIPTS/navicat/install_vs_navicat.sh 
RUN wget -q http://bt.nriet.xyz/down/8P7mhMF1RQHZ.gz -O /opt/Navicat15.tar.gz \
    && cd /opt \
    && tar zxvf Navicat15.tar.gz  \
    && cp /opt/Navicat15/navicat.desktop /usr/share/applications/navicat.desktop \
    && chmod -R +x /opt/Navicat15/* \
    && rm -rf /opt/Navicat15.tar.gz


######### End Customizations ###########
