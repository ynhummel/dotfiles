{ pkgs, ...}: {
  home.packages = with pkgs; [
    lua-language-server
    # Python Stuff
    ruff
    basedpyright
    # FrontEnd Stuff
    typescript-language-server
    vscode-langservers-extracted #HTML/CSS/JSON/ESLint
    # Tools
    yaml-language-server
  ];
}    
