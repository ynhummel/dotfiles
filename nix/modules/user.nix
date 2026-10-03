{ pkgs, ...}: {
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    zoxide
    stow
    tmux
    fzf
    bat
    bash-completion
  ];
} 
