#!/bin/sh
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

ln -s "${SCRIPTPATH}" ~/.config/nvim

# Download vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
vim -c "PlugInstall|q"

base="coc-json coc-tsserver coc-tabnine coc-yank coc-marketplace coc-vimlsp"  
home="coc-rls coc-vimtex"
work="coc-python coc-go"

extensions="${base} ${home} ${work}"

vim -c "CocInstall -sync ${extensions}|q"
