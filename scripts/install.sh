#!/usr/bin/env sh

set -e

vimpath="$HOME/.vim"
nvimpath="$HOME/.config/nvim"
gitpath="$HOME/Code/vimfiles"

echo "Creating folders..."
mkdir -p "$vimpath/autoload"
mkdir -p "$vimpath/undo"
mkdir -p "$vimpath/spell"

echo "Installing vim-plug..."
curl --fail --location --output \
  "$vimpath/autoload/plug.vim" \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

echo "Symlinking files..."
ln -sf "$gitpath/.vimrc" "$HOME/.vimrc"
ln -sf "$gitpath/.gvimrc" "$HOME/.gvimrc"
ln -sf "$gitpath/init.vim" "$vimpath/init.vim"

echo "Symlinking folders..."
ln -sf "$gitpath/snippets" "$vimpath/UltiSnips"
ln -sf "$gitpath/after" "$vimpath/after"
ln -sf "$vimpath" "$nvimpath"
