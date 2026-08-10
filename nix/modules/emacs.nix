{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs: with epkgs; [
      treesit-grammars.with-all-grammars
    ];
  };

  services.emacs = {
    enable = true;
    # Generates a desktop entry to launch 'emacsclient' from your app launcher
    client.enable = true;
    # Automatically starts the daemon when you log into your graphical session
    startWithUserSession = "graphical"; 
  };

  home.packages = with pkgs; [
    nerd-fonts.symbols-only
    symbola
    shellcheck
    ripgrep
    fd
  ];
}
