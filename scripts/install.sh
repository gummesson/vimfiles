#!/usr/bin/env sh

set -e

vimpath=$HOME/.vim
vaupath=$vimpath/autoload
gitpath=$HOME/Git/vimfiles

echo "Creating folders..."
mkdir -p $vaupath
mkdir -p $vimpath/undo
mkdir -p $vimpath/spell

echo "Installing vim-plug..."
curl --fail --location --output \
  $vaupath/plug.vim \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Symlinking files..."
ln -s $gitpath/.vimrc $HOME/.vimrc
ln -s $gitpath/.gvimrc $HOME/.gvimrc

echo "Symlinking folders..."
ln -s $gitpath/snippets $vimpath/UltiSnips
