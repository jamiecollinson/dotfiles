#!/bin/bash

# install essentials
apt-get install software-properties-common bash-completion curl tmux dmenu \
  build-essential cmake

# install external ppas
add-apt-repository ppa:webupd8team/atom
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install atom neovim

# install python support for neovim
apt-get install python-dev python-pip
pip install neovim
