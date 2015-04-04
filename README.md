Installation instructions
========

```
git clone https://github.com/jamiecollinson/dotfiles.git
ln -s dotfiles/vimrc ~/.vimrc
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```

On windows your `_vimrc` should just contain:
```
source $HOME\dotfiles\vimrc
```

On linux symlink instead by running:
```
ln -s ~/dotfiles/vimrc ~/.vimrc
```
