if command -v git &> /dev/null; then
    [ -f /usr/share/bash-completion/completions/git ] && source /usr/share/bash-completion/completions/git

    alias g='git'
    __git_complete g __git_main
    alias gs='git status'
fi
