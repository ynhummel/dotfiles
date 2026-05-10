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
export SDKMAN_DIR="$HOME/.sdkman"
export HELIX_RUNTIME=~/src/helix/runtime

# PATH Construction
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -d "$HOME/.config/local/bin" ] && PATH="$HOME/.config/local/bin:$PATH" # uv path
export PATH

[[ -f ~/.bashrc ]] && . ~/.bashrc
