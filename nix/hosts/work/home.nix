{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "yurihummel";
  home.homeDirectory = "/home/yurihummel";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  imports = [
    /home/yurihummel/.config/nix-modules/git.nix
    /home/yurihummel/.config/nix-modules/lsp.nix
    /home/yurihummel/.config/nix-modules/neovim.nix
  ];

  # Programs
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
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
