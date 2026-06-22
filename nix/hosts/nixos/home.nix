{ config, pkgs, ... }:

{
  home.username = "yurinh";
  home.homeDirectory = "/home/yurinh";

  imports = [
    ../../modules/git.nix
    ../../modules/lsp.nix
    ../../modules/neovim.nix
    ../../modules/wayland.nix
  ];

  # Programs
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    wezterm
    stow
    zoxide
    mc 
    fzf
    bat

    # Devops Tools
    kubectl
    k3d

    # Proprietary
    google-chrome
    obsidian
  ];

  home.file = {
    # DOTFILES
  };

  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  systemd.user.services.wezterm-mux = {
    Unit = {
      Description = "WezTerm Multiplexer Daemon";
      After = [ "graphical-session.target" ]; 
    };

    Service = {
      ExecStart = "${pkgs.wezterm}/bin/wezterm-mux-server";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  home.stateVersion = "26.05";
}
