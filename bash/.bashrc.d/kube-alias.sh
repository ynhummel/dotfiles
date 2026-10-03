if command -v kubectl &> /dev/null; then
    alias k='kubectl'
    alias kcg='kubectl config get-contexts'
    alias kcu='kubectl config use-context'
fi
