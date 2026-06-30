{ config, pkgs, ... }:

{
  home.username = "nana";
  home.homeDirectory = "/home/nana";

  nixpkgs.config.allowUnfree = true;

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
    google-chrome
    obsidian

    freelens-bin
    kubectl
    k3d
  ];

  home.file = {
  };

  home.sessionVariables = {
    FLAKE_PATH = "/home/nana/dotfiles/nix#nana";
    WALLPAPER = "/home/nana/Pictures/gruvbox_tux.png";
    DEFAULT_BROWSER = "firefox";
  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  # Export desktop binaries
  targets.genericLinux.enable = true; # Use this if you are NOT on NixOS (e.g., Ubuntu, Arch)
  xdg.enable = true;                  # Ensures XDG directories are managed properly

  home.stateVersion = "26.05";
}
