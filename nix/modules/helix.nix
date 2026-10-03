{ pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    inputs.helix.packages.${pkgs.system}.default
    # simple-completion-language-server # Snippets for Helix

    yazi
  ];
}    
