#!/bin/bash

# install essentials
apt-get install software-properties-common bash-completion curl tmux dmenu \
  build-essential cmake

# install external ppas
add-apt-repository ppa:webupd8team/atom
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install atom neovim

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
