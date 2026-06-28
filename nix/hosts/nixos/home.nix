{ config, pkgs, ... }:

{
  home.username = "yurinh";
  home.homeDirectory = "/home/yurinh";

  imports = [
    ../../modules/git.nix
    ../../modules/lsp.nix
    ../../modules/user.nix
    ../../modules/neovim.nix
    ../../modules/wayland.nix
  ];

  programs.git.settings.user = {
    name = "Yuri Nana Hummel";
    email = "yurihummel.dev@gmail.com";
  };

  home.packages = with pkgs; [
    nautilus

    # Programming tools
    go
    gopls
    gotools

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
