#!/bin/bash
DEST=/home/erithen/usr/config/bash-vim
cp ~/.vimrc $DEST/files
cp ~/.gvimrc $DEST/files
cp ~/.bashrc $DEST/files
cp ~/.inputrc $DEST/files

cp ~/.bash-powerline.sh $DEST/files
cp -r ~/usr/powerline-shell $DEST

cp -r ~/.vim/colors $DEST/vim/colors
cp -r ~/.vim/indent $DEST/vim/indent
cp -r ~/.vim/plugin $DEST/vim/plugin
cp -r ~/.vim/syntax $DEST/vim/syntax
#git clone https://github.com/gmarik/Vundle.vim $DEST/vim/bundle
