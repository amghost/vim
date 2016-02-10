#!/bin/sh 

#put old vim to asset
mv -f ~/vim ~/vim_old
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old

#bring in new vim config
cd ~/ && git clone https://github.com/amghost/vim.git
mv -f ~/vim ~/.vim
mv -f ~/vim/.vimrc ~/.vimrc

#first install gmarik/vundle.git
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#install plugins configured in .vimrc
vim +PluginInstall +qall
