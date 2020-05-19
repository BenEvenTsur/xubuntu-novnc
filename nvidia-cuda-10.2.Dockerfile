FROM nvcr.io/nvidia/cuda:10.2-devel-ubuntu18.04 
# Default environment
ENV PASSWORD=123456 WIDTH=1920 HEIGHT=1080
# Non interactive mode for xfce4 installation
ARG DEBIAN_FRONTEND=noninteractive
# 5901-vnc 6080-novnc
EXPOSE 6080 5901
# Install all require packages
RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y iputils-ping git python vim gedit wmctrl curl wget apt-transport-https libasound2 sudo openssh-client openssh-server && \
    apt-get install -y xfce4 xfce4-terminal xfce4-goodies vnc4server
# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get -y install google-chrome-stable
# Clone noVNC repository
RUN git clone https://github.com/novnc/noVNC.git /noVNC && \
    git clone https://github.com/novnc/websockify /noVNC/utils/websockify
# Copy the Chrome launcher    
COPY Google_Chrome.desktop /root/Desktop/Chrome.desktop
# Copy the entrypoint script
COPY run.sh /opt/run.sh
# Copy the xstartup script
COPY xstartup /root/.vnc/xstartup
# Set few configuration for xfce4 and ssh
RUN mkdir /var/run/sshd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    chmod 777 /opt/run.sh && \
    chmod 777 /root/Desktop/Chrome.desktop && \
    chmod 755 /root/.vnc/xstartup && \
    cp /etc/xdg/xfce4/panel/default.xml /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
# Defined the entrypoint script
ENTRYPOINT /opt/run.sh
