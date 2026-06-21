{ config, pkgs, ... }:

{
  home.username = "yurinh";
  home.homeDirectory = "/home/yurinh";

  imports = [
    /home/yurinh/.config/nix-modules/git.nix
    /home/yurinh/.config/nix-modules/lsp.nix
    /home/yurinh/.config/nix-modules/neovim.nix
    /home/yurinh/.config/nix-modules/wayland.nix
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
      # Ensures the server waits for Niri to initialize
      After = [ "graphical-session.target" ]; 
    };

    Service = {
      # Systemd manages the background process, so we tell wezterm not to fork
      # ExecStart = "${pkgs.wezterm}/bin/wezterm-mux-server --no-daemonize";
      ExecStart = "${pkgs.wezterm}/bin/wezterm-mux-server";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  home.stateVersion = "26.05"; # Please read the comment before changing.
}
