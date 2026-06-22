{
  description = "Unified Flake for Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      input.nixpkgs.follows = "nixpkgs"
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    
    # NixOS Machine
    nixosConfigurations.acer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; }; 
      modules = [
        ./hosts/nixos/configuration.nix
        ./hosts/nixos/hardware-configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.users.yurinh = import ./hosts/nixos/home.nix;
        }
        mangowc.nixosModules.mango
      ];
    };

    # Work Machine
    homeConfigurations."yurihummel@fretebras" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ./hosts/work/home.nix
      ];
    };

  };
}
