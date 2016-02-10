#!/bin/sh 

#install vim git etc.
if which apt-get >/dev/null; then
    sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git
elif which yum >/dev/null; then
    sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel   
elif which brew > /dev/null; then
    brew install vim ctags git astyle
fi

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
