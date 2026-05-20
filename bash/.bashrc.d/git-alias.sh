if command -v git &> /dev/null; then
    alias gs='git status'
    alias gsw='git switch'
    alias gnb='git checkout -b'
    alias gp='git pull'
    alias gpcurr='git push origin "$(git branch --show-current)"'
    alias grb='git rebase'
    alias ga='git add'
    alias gaa='git add .'
    alias gcm='git commit -m'
fi
