# Vimfiles

My [(g)Vim](http://www.vim.org/) files.

## Installation

1. Run `scripts/install.sh` (on Linux) or `scripts/install.cmd` (on Windows).
2. Launch (g)Vim and run `:PlugInstall`.

## Troubleshooting

1. On Windows, you need to have `C:\Program Files (x86)\Git\bin` in your PATH.
2. On Windows, you may need to run the `install.cmd` script as an
   *Administrator*.

## Miscellaneous

If you're not using [vim-plug](https://github.com/junegunn/vim-plug), add these
lines to your `.vimrc` file:

~~~ viml
filetype plugin indent on
syntax on
~~~
