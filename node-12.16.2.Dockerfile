FROM beneventsur/xubuntu:vscode-1.44.2
#Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_12.x | sh - && \
    apt-get install -y nodejs
