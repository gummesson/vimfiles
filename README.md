# Vimfiles

My (g)Vim files.

## Setup

Get [Vundle](https://github.com/gmarik/vundle):

~~~ bash
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/vundle
~~~

Symlink the `.vimrc` and `.gvimrc` files:

~~~ bash
ln -s [SOURCE] [DESTINATION]   # Unix
mklink [DESTINATION] [SOURCE]  # Windows
~~~

Launch [Vim](http://www.vim.org/) and run `:PluginInstall`.
