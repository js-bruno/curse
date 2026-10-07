FROM ubuntu:20.04

WORKDIR /app
ADD ./ /app

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y python3 curl\
  && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash vimuser

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod u+x nvim.appimage

USER vimuser
