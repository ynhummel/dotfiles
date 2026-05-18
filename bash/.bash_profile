# ~/.bash_profile: executed by bash(1) for login shells.

# Editor Settings
export EDITOR="hx"
export VISUAL="hx"

# XDG Base Directory Specifications
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share" # old 
export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache" # old
export XDG_STATE_HOME="$HOME/.local/state" # A newer addition for log files/history

# Zoxide Configuration
export _ZO_ECHO=1
export _ZO_DATA_DIR="$HOME/.local/share/zoxide"
export _ZO_RESOLVE_SYMLINKS=1

# Bash History Settings
[ ! -d "$XDG_STATE_HOME/bash" ] && mkdir -p "$XDG_STATE_HOME/bash"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export HISTSIZE=10000
export HISTFILESIZE=10000 

# Tools Environment
export HELIX_RUNTIME=~/src/helix/runtime
export GOPATH="$HOME/go"
export GOINSTALL="/usr/local/go/bin"
export NVM_DIR="$HOME/.config/nvm"
[ -d "$HOME/.nix-profile/share" ] && export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

# PATH Construction
# prepend
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.config/local/bin" ] && PATH="$HOME/.config/local/bin:$PATH" # uv path

# append
[ -d "$GOINSTALL" ] && PATH="$PATH:$GOINSTALL"
[ -d "$GOPATH/bin" ] && PATH="$PATH:$GOPATH/bin"

# script
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ] && . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

export PATH

# Initialize shell
[[ -f ~/.bashrc ]] && . ~/.bashrc
