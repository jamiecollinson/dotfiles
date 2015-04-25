Installation instructions
========

Make sure node is installed (remember to use https://github.com/creationix/nvm on Ubuntu to prevent needing sudo to install globally)

```
git clone https://github.com/jamiecollinson/dotfiles.git
```

On linux symlink by running:
```
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/eshintrc ~/.eshintrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tern-config ~/.tern-config
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
