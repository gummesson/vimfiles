#!/usr/bin/env sh

set -e

vimpath=$HOME/.vim
gitpath=$HOME/Git/vimfiles

echo "Creating folders..."
mkdir -p $vimpath/autoload
mkdir -p $vimpath/undo
mkdir -p $vimpath/spell

echo "Installing vim-plug..."
curl --fail --location --output \
  $vimpath/autoload/plug.vim \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Symlinking files..."
ln -sf $gitpath/.vimrc $HOME/.vimrc
ln -sf $gitpath/.gvimrc $HOME/.gvimrc

echo "Symlinking folders..."
ln -sf $gitpath/snippets $vimpath/UltiSnips
