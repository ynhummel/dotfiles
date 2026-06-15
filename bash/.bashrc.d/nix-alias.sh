if command -v home-manager &> /dev/null; then
    alias hms='home-manager switch'
fi

if command -v nix-rebuild &> /dev/null; then
    alias nrs='sudo nixos-rebuild switch'
fi

if command -v nix &> /dev/null; then
    alias ncg='nix-collect-garbage'
    alias nsh='nix-shell'
    alias nsp='nix-shell --pure'
fi