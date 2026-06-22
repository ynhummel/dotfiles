{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs: with epkgs; [
      treesit-grammars.with-all-grammars
      nix-ts-mode
    ];
  };

  services.emacs = {
    enable = true;
    # Generates a desktop entry to launch 'emacsclient' from your app launcher
    client.enable = true;
    # Automatically starts the daemon when you log into your graphical session
    startWithUserSession = "graphical"; 
  };
}
