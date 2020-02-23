#!/bin/sh
ANTIGEN_SRC_PATH="$HOME/.antigen-src"

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
ln -s "${SCRIPTPATH}/zshrc" ~/.zshrc
ln -s "${SCRIPTPATH}/aliases.zsh" ~/.aliases
ln -s "${SCRIPTPATH}/exports.zsh" ~/.exports

curl -L git.io/antigen > antigen.zsh
mkdir -p "$ANTIGEN_SRC_PATH"
mv antigen.zsh "$ANTIGEN_SRC_PATH" 
