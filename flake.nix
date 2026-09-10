{
  description = "Configuración NixOS de mteo";

  inputs = { # pkgs-nix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = { # home-manager
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # lazyvim
    lazyvim.url = "github:pfassina/lazyvim-nix";

    dms = { #DankMaterialShell
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dank-greeter = { # DankMaterialGreeter
      url = "github:AvengeMedia/dank-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, lazyvim, dms, dank-greeter, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    nixosConfigurations = {
      
      # --- CONFIGURACIÓN LAPTOP ---
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          # Host:
          ./system/hosts/laptop/hardware-configuration.nix
          ./system/hosts/laptop/default.nix
          ./system/hosts/laptop/amd.nix
          # Configuration:
          ./configuration.nix
          #DankMaterialGreeter
          inputs.dank-greeter.nixosModules.default

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.mteo = {
              imports = [ 
                  lazyvim.homeManagerModules.default 
                  ./home.nix 
                ];
            };
          }
        ];
      };

      # --- CONFIGURACIÓN PC DE ESCRITORIO ---
      pc-escritorio = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          # Host:
          ./system/hosts/PC/hardware-configuration.nix
          ./system/hosts/PC/default.nix
          ./system/hosts/PC/nvidia.nix
          # Configuration:
          ./configuration.nix
          #DankMaterialGreeter
          inputs.dank-greeter.nixosModules.default

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.mteo = {
              imports = [ 
                  lazyvim.homeManagerModules.default 
                  ./home.nix 
                ];
            };
          }
        ];
      };

    };
  };
}
