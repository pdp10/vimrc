#!/bin/bash

mv ~/.vimrc ~/.vimrc.bak 2>/dev/null
ln -s vimrc ~/.vimrc
vim +PlugInstall +qall
cd plugged/vimproc.vim && make

