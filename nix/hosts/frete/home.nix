{ config, pkgs, ... }:
let 
  gitPersonalDirs = [
    "~/dotfiles/"
    "~/Documents/bag/"
  ];
in {
  home.username = "yurihummel";
  home.homeDirectory = "/home/yurihummel";

  home.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../modules/git.nix
    ../../modules/lsp.nix
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
    nerd-fonts.jetbrains-mono
    obsidian
    wezterm
    stow

    # Terminal Tools
    zoxide
    mc  # Midnight Commander
    fzf
    bat

    # Work
    lazydocker
    kubectl
    grpcurl
    jq
    yq
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

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yurihummel/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  #Let home manager manage my fonts
  fonts.fontconfig.enable = true;

  # Export desktop binaries
  targets.genericLinux.enable = true; # Use this if you are NOT on NixOS (e.g., Ubuntu, Arch)
  xdg.enable = true;                  # Ensures XDG directories are managed properly
}
