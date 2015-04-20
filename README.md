Installation instructions
========

```
git clone https://github.com/jamiecollinson/dotfiles.git
```

On linux symlink by running:
```
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/eshintrc ~/.eshintrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
```

On windows your `_vimrc` should just contain:
```
mklink %HOMEPATH%\.vimrc %HOMEPATH%\dotfiles\vimrc
mklink %HOMEPATH%\.eshintrc %HOMEPATH%\dotfiles\eshintrc
```
