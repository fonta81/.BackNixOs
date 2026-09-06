{ config, pkgs, ... }:

{
  system.stateVersion = "26.05";

  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # home-manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  # Eliminar basura de mas de 15d
  nix.gc = {
    automatic = true;
    dates = "weekly"; 
    options = "--delete-older-than 15d";
  };
}
