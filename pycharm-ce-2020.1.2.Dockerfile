FROM beneventsur/xubuntu:18.04-novnc
ARG PYCHARM_VERS=2020.1.2
RUN cd /tmp && \
   wget https://download.jetbrains.com/python/pycharm-community-$PYCHARM_VERS.tar.gz && \
   tar xzf pycharm-*.tar.gz -C /opt/ && \
   rm pycharm-*.tar.gz && \
   ln -s /opt/pycharm-community-2020.1.2/bin/pycharm.sh /usr/bin/pycharm && \
   cp /opt/pycharm-community-2020.1.2/bin/pycharm.png /opt/pycharm.png
COPY PyCharm.desktop /root/Desktop/PyCharm.desktop
