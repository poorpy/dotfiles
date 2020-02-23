#!/bin/sh

printf "Removing ZSH config files\n"

for name in zshrc aliases exports; do
    rm "$HOME/.$name"
done

rm -rf ~/.antigen-src/
