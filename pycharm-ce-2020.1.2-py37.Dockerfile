FROM beneventsur/xubuntu:pycharm-ce-2020.1.2
ARG PYTHON_VERS=3.7
RUN apt-get update && \
    apt-get install -y python3-pip software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get install -y python$PYTHON_VERS && \
    rm /usr/bin/python && \
    ln -s /usr/bin/python$PYTHON_VERS /usr/bin/python && \
    echo "python -m pip \$@" > /usr/bin/pip && \
    chmod 755 /usr/bin/pip
