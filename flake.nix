{
  description = "Configuración NixOS de mteo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazyvim.url = "github:pfassina/lazyvim-nix";
  };

  outputs = { self, nixpkgs, home-manager, lazyvim, ... }@inputs: {
    nixosConfigurations = {
      
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hardware-configuration.nix
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mteo = {
              imports = [ lazyvim.homeManagerModules.default ./home.nix ];
            };
          }
        ];
      };
    };
  };
}
