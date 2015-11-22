#!/bin/bash

# install essentials
apt-get install -y software-properties-common bash-completion curl tmux dmenu \
  build-essential cmake unclutter

# install external ppas
add-apt-repository -y ppa:webupd8team/atom
add-apt-repository -y ppa:neovim-ppa/unstable
apt-get update
apt-get install -y atom neovim

# install python support for neovim
apt-get install -y python-dev python-pip
pip install neovim
