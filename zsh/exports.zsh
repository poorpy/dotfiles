#!/bin/env zsh

export EDITOR='nvr --remote -s'
export READER='zathura'

export PATH=$PATH:/home/poorpy/.bin:/home/poorpy/.cargo/bin
export PATH=$PATH:/home/poorpy/.local/bin
export PATH=$PATH:/home/poorpy/.emacs.d/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME:/.local/bin:$PATH"
export PATH="$PATH:/usr/lib/go/bin:$HOME/go/bin"
export PATH="$PATH:$HOME/.nimble/bin"
export PATH="$PATH:$HOME/.luarocks/bin"


export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

export PYTHONPATH="$PYTHONPATH:$HOME/git/amg/src"
export GOPATH=$HOME/.go
# export GOROOT=$HOME/.goroot
export GOBIN=$HOME/.gobin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$GOBIN

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

