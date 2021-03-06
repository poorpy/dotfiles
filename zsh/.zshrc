# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/poorpy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export EDITOR='nvim'
export READER='zathura'
# export TERM='st'
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# alias grep='grep --color=auto'
# alias ls='ls --color=auto'
# alias ll='ls -l'
# alias vimrc='cd /home/poorpy/.config/nvim/; nvim init.vim; cd -; '
# alias :q='exit'
# alias cls='clear; ls'
# alias cll='clear; ll'
# alias gdb='gdb -quiet'

# alias adm="git status | grep modified | awk '{print $NF}' | xargs git add"

export PATH=$PATH:/home/poorpy/.bin:/home/poorpy/.cargo/bin
export PATH=$PATH:/home/poorpy/.local/bin
export PATH=$PATH:/home/poorpy/.emacs.d/bin

source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle cargo
antigen bundle git
antigen bundle systemd
antigen bundle rust
antigen bundle ripgrep
antigen bundle pip
antigen bundle src
antigen theme minimal

antigen apply

fpath+=~/.zfunc

# export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
# export CC=/usr/bin/clang
# export CXX=/usr/bin/clang++
# export TEXINPUTS=.:$HOME/.latex//
# export CPATH=$CPATH:/usr/include/qt/:/usr/include/qt/QtCore/:/usr/include/qt/QtGui:/usr/include/qt/QtWidgets:/usr/include/qt/QtTest
# export CPATH=$CPATH:/home/poorpy/stm32_zesp/Drivers/STM32F0xx_HAL_Driver/Inc/
# export CPATH=$CPATH:/home/poorpy/stm32_zesp/Drivers/CMSIS/Device/ST/STM32F0xx/Include/
# export CPATH=$CPATH:/home/poorpy/stm32_zesp/Inc/

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cabal/bin:$PATH"
# export PATH="$HOME:/.local/bin:$PATH"
