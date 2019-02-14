Forked from https://gitlab.esy.fun/yogsototh/vimrc

# Install

```
git clone https://github.com/pdp10/vimrc.git .vim
mv .vimrc .vimrc.bak 2>/dev/null
ln -s .vim/vimrc .vimrc
vim +PlugInstall +qall
cd ~/.vim/plugged/vimproc.vim && make
```

