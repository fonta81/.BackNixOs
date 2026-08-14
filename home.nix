{ config, pkgs, ... }:

{
home.stateVersion = "26.05";

  imports = [
  ./home-modules/git.nix
  ];




# Fin
}
