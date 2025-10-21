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

# ========== ALIASES ==========
alias vim="nvim"
alias docom="docker compose"

# Git Alias
alias gs="git status"
alias glo="git log --oneline"

# Tools
alias cat='bat'

alias ls='eza'
alias lla='eza -la'
alias ll='eza -l'
alias la='eza -a'

# config alias
alias vimconf="nvim ~/.config/nvim --cmd 'cd ~/.config/nvim'"
alias termconf="nvim ~/.config/ghostty/config"
alias zconf="nvim ~/.config/zsh/.zshrc"
alias zsource="source ~/.config/zsh/.zshrc"

# Lazy
alias lzd="lazydocker"
alias lzg="lazygit"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# Set Golang
export GOINSTALL="/usr/local/go/bin"
export GOPATH="$HOME/go"
export PATH=$PATH:$GOINSTALL:$GOPATH/bin

# Set Zig
export ZIGPATH="$HOME/.zig"
export PATH="$PATH:$ZIGPATH/zig-aarch64-macos-0.16.0-dev.731+958faa703"
export PATH="$PATH:$ZIGPATH/tools"

# Set NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
