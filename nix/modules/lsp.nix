{ pkgs, ...}: {
  home.packages = with pkgs; [
    lua-language-server
    # Golang
    gopls
    gotools
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
