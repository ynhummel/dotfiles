if command -v git &> /dev/null; then
    if [ -f /usr/share/bash-completion/completions/git ]; then
        source /usr/share/bash-completion/completions/git
    elif [ -f "/etc/profiles/per-user/$USER/share/bash-completion/completions/git" ]; then
        source "/etc/profiles/per-user/$USER/share/bash-completion/completions/git"
    fi

    alias g='git'
    if type -t __git_complete &> /dev/null; then
        __git_complete g __git_main
    fi
    alias gs='git status'
fi
