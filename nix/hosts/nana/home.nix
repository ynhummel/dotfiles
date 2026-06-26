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
    ../../modules/programming.nix
  ];

  programs.git.settings.user = {
    name = "Yuri Nana Hummel";
    email = "yurihummel.dev@gmail.com";
  };

  home.packages = with pkgs; [
    google-chrome
    obsidian
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  # Export desktop binaries
  targets.genericLinux.enable = true; # Use this if you are NOT on NixOS (e.g., Ubuntu, Arch)
  xdg.enable = true;                  # Ensures XDG directories are managed properly

  home.stateVersion = "26.05";
}
