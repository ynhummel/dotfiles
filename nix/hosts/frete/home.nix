{ config, pkgs, ... }:
let 
  gitPersonalDirs = [
    "~/dotfiles/"
    "~/Documents/bag/"
  ];
in {
  home.username = "yurihummel";
  home.homeDirectory = "/home/yurihummel";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../modules/git.nix
    ../../modules/lsp.nix
    ../../modules/user.nix
    ../../modules/neovim.nix
  ];

  programs.git = {
    settings.user = {
      name = "Yuri Nana Hummel";
      email = "yuri.hummel@fretebras.com.br";
    };

    includes = builtins.map (dir: {
      condition = "gitdir:${dir}";
      contents = {
        user = {
          name = "Yuri Nana Hummel";
          email = "yurihummel.dev@gmail.com";
        };
      };
    }) gitPersonalDirs;
  };

  home.packages = with pkgs; [
    obsidian

    kubectl
    lazydocker

    grpcurl
    jq
    yq
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  # Export desktop binaries
  targets.genericLinux.enable = true; # Use this if you are NOT on NixOS (e.g., Ubuntu, Arch)
  xdg.enable = true;                  # Ensures XDG directories are managed properly

  home.stateVersion = "26.05";
}
