if command -v home-manager &> /dev/null; then
    alias hms='home-manager switch'
    alias hmconf='$EDITOR $HOME/.config/home-manager'
fi

if command -v nix &> /dev/null; then
    alias ncg='nix-collect-garbage'
    alias nsh='nix-shell'
    alias nsp='nix-shell --pure'
fi
