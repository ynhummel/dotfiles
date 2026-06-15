{ pkgs, ...}: {
  home.packages = with pkgs; [
    helix
    simple-completion-language-server # Snippets for Helix
  ];
}    
