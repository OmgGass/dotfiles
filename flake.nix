# /dotfiles/flake.nix
{
  description = "Minha configuracao do NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations."nixos-btw" = nixpkgs.lib.nixosSystem { # <-- Troque "nixos-btw" pelo seu hostname
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        
        ./configuration.nix
        ./hardware-configuration.nix 
        
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.Garcia = import ./home/home.nix; 
        }
      ];
    };
  };
}
