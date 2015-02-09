Installation instructions
========

```
git clone https://github.com/jamiecollinson/dotfiles.git
ln -s dotfiles/vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then within vim run `:PlugInstall`
