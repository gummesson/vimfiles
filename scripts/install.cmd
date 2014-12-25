@echo off
setlocal EnableExtensions EnableDelayedExpansion

set vimpath=%USERPROFILE%\vimfiles
set vaupath=%vimpath%\autoload
set gitpath=D:\Git\vimfiles

echo Creating folders...
md %vaupath%
md %vimpath%\undo
md %vimpath%\spell

echo Installing vim-plug...
curl --fail --location --output^
  %vaupath%/plug.vim^
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo Symlinking files...
mklink %USERPROFILE%\.vimrc %gitpath%\.vimrc
mklink %USERPROFILE%\.gvimrc %gitpath%\.gvimrc

echo Symlinking folders...
mklink /d %vimpath%\UltiSnips %gitpath%\snippets

endlocal
