#!/usr/bin/env sh

set -e

vimpath=$HOME/.vim
plugpath=$vimpath/plugged/vim-nodejs-complete/after/autoload

echo "Updating completion data..."
cd $plugpath
git update-index --assume-unchanged nodejs-doc.vim
node update-nodejs-doc.js
