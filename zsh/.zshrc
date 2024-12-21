
# ASDF
# . "$HOME/.asdf/asdf.sh"

# PROMPT
fpath=($ZDOTDIR $fpath)
autoload -Uz prompt && prompt

# COMPLETION
source $ZDOTDIR/completions.zsh

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

# FZF

# Override colors
eval "$(dircolors -b $ZDOTDIR/dircolors)"

# ========== ALIASES ==========
alias vim="nvim"
alias docom="docker compose"

# Git Alias
alias gs="git status"
alias glo="git log --oneline"

# enable color support of ls and also add handy aliases
alias ls='ls --color'
alias grep='grep --color'
alias fgrep='fgrep --color'
alias egrep='egrep --color'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

# config alias
alias vimconf="nvim ~/.config/nvim --cmd 'cd ~/.config/nvim'"
alias termconf="nvim ~/.wezterm.lua"
alias zconf="nvim ~/.config/zsh/.zshrc"
alias zsource="source ~/.config/zsh/.zshrc"

# Notes
alias jnl="nvim ~/VimNotes/Journal/$(date +%y-%d-%m.md)"
alias vfolder="nvim ~/VimNotes/"

alias emacs="emacsclient -c -a 'emacs'"

# Lazy
alias lzd="lazydocker"
alias lzg="lazygit"

# Set Golang
export GOINSTALL="/usr/local/go/bin"
export GOPATH="$HOME/go"
export PATH=$PATH:$GOINSTALL:$GOPATH/bin

# Set Zig
export ZIGPATH="$HOME/zig"
export PATH="$PATH:$ZIGPATH/zig-linux-x86_64-0.14.0-dev.2245+4fc295dc0"

#DOOM
export PATH="$PATH:$HOME/.config/emacs/bin"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
