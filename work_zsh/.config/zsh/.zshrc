# COMPLETION
source $ZDOTDIR/completions.zsh

#PROMPT
PROMPT='%n@%m %1~ %# '

# VIM MODE
bindkey -v
export KEYTIMEOUT=1
cursor_mode() {
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# ========== ALIASES ==========
alias vim="nvim"
alias docom="docker compose"

# Git Alias
alias gs="git status"

# enable color support of ls and also add handy aliases
alias ls='ls --color'
alias grep='grep --color'
alias fgrep='fgrep --color'
alias egrep='egrep --color'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

# Tools
alias cat='bat'

# config alias
alias vimconf="nvim ~/.config/nvim --cmd 'cd ~/.config/nvim'"
alias termconf="nvim ~/.config/ghostty/config"
alias zconf="nvim ~/.config/zsh/.zshrc"
alias zsource="source ~/.config/zsh/.zshrc"

# alias emacs="emacsclient -c -a 'emacs'"

# Lazy
alias lzd="lazydocker"
alias lzg="lazygit"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set Golang
export GOINSTALL="/usr/local/go/bin"
export GOPATH="$HOME/go"
export PATH=$PATH:$GOINSTALL:$GOPATH/bin

# Set Zig
export ZIGPATH="$HOME/zig"
export PATH="$PATH:$ZIGPATH/zig-linux-x86_64-0.13.0"

# NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Set PHP
export PHP_INI_SCAN_DIR="/home/yurihummel/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PATH="$PATH:$PHP_INI_SCAN_DIR"

# libgit2 #DEPRECATED
# export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib:/usr/local/lib/pkgconfig
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# ASDF #DEPRECATED
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

