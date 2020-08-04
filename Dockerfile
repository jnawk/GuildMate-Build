FROM ubuntu:18.04

# postgresql installs tzdata which wants interactive config, squash that
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -yq install \
        python3.7 python3-venv python3.7-venv python3-pip python3-wheel python3-dev \
        nodejs npm \
        git \
        postgresql sudo \
        vim

RUN mkdir /guild
WORKDIR guild
RUN python3.7 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip wheel && \
    pip install black discord discord.py Flask Flask-API Flask-Discord pytest \
      pytest-asyncio python-dotenv PyYAML SQLAlchemy websockets && \
    npm install eslint@~6 react webpack && \
    echo . /guild/venv/bin/activate >> ~/.bashrc
