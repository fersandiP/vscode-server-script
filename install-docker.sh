#!/bin/bash

set -x

sudo snap refresh snapd
sudo snap install docker

sudo addgroup --system docker
sudo adduser $USER docker

# You can extend this script to install docker plugin such as buildx
