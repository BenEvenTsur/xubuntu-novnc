FROM beneventsur/xubuntu:18.04-novnc
#Install Visual Studio Code
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/ && \
    sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && \
    apt-get install apt-transport-https && \
    apt-get update && \
    apt-get install code && \
    sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/x86_64-linux-gnu/libxcb.so.1
# Copy vscode launcher
COPY vscode.desktop /root/Desktop/vscode.desktop
COPY code.svg /usr/share/code/code.svg
