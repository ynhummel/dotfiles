{ pkgs, ...}: {
  home.packages = with pkgs; [
    # C
    gnumake
    gcc

    # Golang
    go
    gopls
    gotools

    # Devops
    kubectl
    k3d # needs docker
  ];
}    
