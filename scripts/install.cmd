@echo off
setlocal EnableExtensions EnableDelayedExpansion

set vimpath=%USERPROFILE%\vimfiles
set gitpath=D:\Git\vimfiles

echo Creating folders...
md %vimpath%\autoload
md %vimpath%\undo
md %vimpath%\spell

echo Installing vim-plug...
curl --fail --location --output^
  %vimpath%\autoload\plug.vim^
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo Symlinking files...
mklink %USERPROFILE%\.vimrc %gitpath%\.vimrc
mklink %USERPROFILE%\.gvimrc %gitpath%\.gvimrc

echo Symlinking folders...
mklink /d %vimpath%\UltiSnips %gitpath%\snippets

endlocal
