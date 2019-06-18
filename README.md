Forked from https://gitlab.esy.fun/yogsototh/vimrc

# Install

```
cd ~/
git clone https://github.com/pdp10/vimrc.git .vim

# VIM
mv .vimrc .vimrc.bak 2>/dev/null
ln -s .vim/vimrc .vimrc

# NEOVIM
mkdir -p .config/nvim
ln -s .vim/vimrc .config/nvim/init.vim

# Inside vim/neovim run 
:PlugInstall 
```

