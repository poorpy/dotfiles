#!/bin/sh
ANTIGEN_SRC_PATH="$HOME/.antigen-src"

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
ln -s "${SCRIPTPATH}/zshrc" ~/.zshrc

curl -L git.io/antigen > antigen.zsh
mkdir -p "$ANTIGEN_SRC_PATH"
mv antigen.zsh "$ANTIGEN_SRC_PATH" 


