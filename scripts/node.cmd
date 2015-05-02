@echo off
setlocal EnableExtensions EnableDelayedExpansion

set vimpath=%USERPROFILE%\vimfiles
set plugpath=%vimpath%\plugged\vim-nodejs-complete\after\autoload

cd /d %plugpath%
git update-index --assume-unchanged nodejs-doc.vim
node update-nodejs-doc.js

endlocal
