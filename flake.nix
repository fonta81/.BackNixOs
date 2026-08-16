{
  description = "Configuración NixOS de mteo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazyvim.url = "github:pfassina/lazyvim-nix";

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, lazyvim, dms, ... }@inputs: {
    nixosConfigurations = {
      
      # --- CONFIGURACIÓN LAPTOP ---
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./system/laptop/hardware-configuration.nix
          ./system/laptop/default.nix
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.mteo = {
              imports = [ lazyvim.homeManagerModules.default ./home.nix ];
            };
          }
        ];
      };

      # --- CONFIGURACIÓN PC DE ESCRITORIO ---
      pc-escritorio = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/pc-escritorio/hardware-configuration.nix
          .system/PC/default.nix
          ./configuration.nix                       

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.mteo = {
              imports = [ lazyvim.homeManagerModules.default ./home.nix ];
            };
          }
        ];
      };

    };
  };
}
