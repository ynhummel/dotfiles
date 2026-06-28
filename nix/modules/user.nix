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

  # Terminal Config
  programs.foot = {
    enable = true;
    server.enable = true;

    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=10";
        dpi-aware = "yes";
        pad = "0x0";
        include = "${pkgs.foot.themes}/share/foot/themes/alacritty";
      };

      colors-dark = {
        alpha="0.90";
      };
    };
  };
} 
