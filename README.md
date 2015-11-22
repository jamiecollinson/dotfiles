# Installation instructions

Install chroot with

```
sudo sh ~/Downloads/crouton -t xiwi -r trusty
```

Then enter chroot and

```
sudo apt-get install git
git clone https://github.com/jamiecollinson/dotfiles.git ~/dotfiles
sudo sh ~/dotfiles/bootstrap.sh
```

## To be moved into bootstrap.sh

Make sure node is installed (remember to use https://github.com/creationix/nvm on Ubuntu to prevent needing sudo to install globally)

On linux symlink by running:
```
ln -s ~/dotfiles/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/eshintrc ~/.eshintrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tern-config ~/.tern-config
ln -s ~/dotfiles/Xresources ~/.Xresources
ln -s ~/dotfiles/xinitrc ~/.xinitrc

ln -s ~/dotfiles/bspwm/ ~/.config/bspwm/
ln -s ~/dotfiles/sxhkd/ ~/.config/sxhkd/
ln -s ~/dotfiles/colors/ ~/.config/colors/
```

On windows link with:
```
mklink %HOMEPATH%\.vimrc %HOMEPATH%\dotfiles\vimrc
mklink %HOMEPATH%\.eshintrc %HOMEPATH%\dotfiles\eshintrc
```

(Optional - for working on JS - maybe should be a post install task in vimrc?)
Install eshint and plugins:
```
npm install -g eslint babel-eslint eslint-plugin-react
```
