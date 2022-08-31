#!/bin/env zsh

export EDITOR='nvr --remote -s'
export READER='zathura'

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export CC=$(which clang++)
export CXX=$(which clang++)

export PYTHONPATH="$PYTHONPATH:${HOME}/git/amg/src"
export GOPATH=$HOME/.go
export GOBIN=$HOME/.gobin

export PATH="$PATH:${HOME}/.cargo/bin:${HOME}/.local/bin"
export PATH="$PATH:${HOME}/.local/bin"
export PATH="$PATH:${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin"
export PATH="$PATH:${HOME}/.luarocks/bin"
export PATH="$PATH:$GOPATH/bin:$GOBIN"
export PATH="$HOME/.pyenv/bin:$PATH"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
