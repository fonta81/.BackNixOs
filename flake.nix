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

  outputs = { self, nixpkgs, home-manager, lazyvim, dms, ... }@inputs: 
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
          ./system/hosts/laptop/hardware-configuration.nix
          ./system/hosts/laptop/default.nix
          ./configuration.nix
          ./core/packages.nix
          inputs.dms.nixosModules.greeter

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
          ./system/hosts/PC/hardware-configuration.nix
          ./system/hosts/PC/default.nix
          ./system/hosts/PC/nvidia.nix
          ./configuration.nix
          ./core/packages.nix
          inputs.dms.nixosModules.greeter

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
      # --- DEVSHELL PARA PROYECTOS GO (bubbletea + oto) ---
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.go
          pkgs.gopls
          pkgs.pkg-config
          pkgs.alsa-lib
        ];

        shellHook = ''
          echo "Entorno Go listo (bubbletea + oto)"
          go version
        '';
      };
  };
}
