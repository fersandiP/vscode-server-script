#!/bin/bash

set -x

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
. ~/.asdf/asdf.sh

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add golang https://github.com/kennyp/asdf-golang.git
asdf plugin add php https://github.com/asdf-community/asdf-php.git
asdf plugin add python https://github.com/danhper/asdf-python.git
asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git 

# Install required dependencies
sudo apt -y install \
    autoconf m4 libncurses5-dev libssh-dev \
    unixodbc-dev xsltproc fop libxml2-utils \
    libncurses-dev openjdk-11-jdk
