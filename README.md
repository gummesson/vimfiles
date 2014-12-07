# Vimfiles

My (g)Vim files.

## Setup

Get [Vundle](https://github.com/gmarik/vundle):

~~~ bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
~~~

Symlink the `.vimrc` and `.gvimrc` files to `~/`:

~~~ bash
ln -s <source> <destination>   # Unix
mklink <destination> <source>  # Windows
~~~

Symlink the `snippets` folder to `~/.vim/UltiSnips` and `~/vimfiles/UltiSnips`:

~~~ bash
ln -s <source> <destination>      # Unix
mklink /D <destination> <source>  # Windows
~~~

## Installation

Launch [(g)Vim](http://www.vim.org/) and run `:PluginInstall`.
