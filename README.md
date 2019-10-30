# Install

```
# VIM
git clone https://github.com/pdp10/vimrc.git $HOME/.vim

# NEOVIM
git clone https://github.com/pdp10/vimrc.git $HOME/.config/nvim

### suggested configuration for nvim users ($HOME/.bashrc):
export VISUAL=nvim
export EDITOR="$VISUAL"
alias vim="$VISUAL"
alias vi="$VISUAL"

# After starting vim/nvim run:
:PlugInstall

# plugins will be installed in $HOME/.vim whether VIM or NEOVIM is used
```
