if command -v home-manager &> /dev/null; then
    alias hms='home-manager switch'
    alias hmconf='$EDITOR $HOME/.config/home-manager'
fi
