#!/bin/env zsh

# export EDITOR='nvr --remote -s'
export EDITOR='nvim'
export READER='zathura'

export PATH=$PATH:/home/poorpy/.bin:/home/poorpy/.cargo/bin
export PATH=$PATH:/home/poorpy/.local/bin
export PATH=$PATH:/home/poorpy/.emacs.d/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cabal/bin:$PATH"
export PATH="$HOME:/.local/bin:$PATH"


export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

export GOPATH=$HOME/.go
# export GOROOT=$HOME/.goroot
export GOBIN=$HOME/.gobin
export PATH=$PATH:$GOBIN:$GOPATH/bin

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

export NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export SONAR_SCANNER_HOME="/opt/sonar-scanner"
export PATH="${PATH}:${SONAR_SCANNER_HOME}/bin"
