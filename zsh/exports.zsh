#!/bin/env zsh

export EDITOR='nvr --remote'
export READER='zathura'

export PATH=$PATH:/home/poorpy/.bin:/home/poorpy/.cargo/bin
export PATH=$PATH:/home/poorpy/.local/bin
export PATH=$PATH:/home/poorpy/.emacs.d/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cabal/bin:$PATH"
export PATH="$HOME:/.local/bin:$PATH"


export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
