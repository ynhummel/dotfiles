# COMPLETION
source $ZDOTDIR/completions.zsh

plugins=(git kubectl)

#PROMPT
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%n@%m %1~ %F{red}${vcs_info_msg_0_}%f%# '

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

# Tools
alias cat='batcat'
alias ls='eza'
alias ll='ls -alF'
alias la='ls -A'

# config alias
alias vimconf="nvim ~/.config/nvim --cmd 'cd ~/.config/nvim'"
alias termconf="nvim ~/.config/alacritty/alacritty.toml"
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

# NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set PHP
export PHP_INI_SCAN_DIR="/home/yurihummel/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PATH="$PATH:$PHP_INI_SCAN_DIR"

# ASDF
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
