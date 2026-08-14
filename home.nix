{ config, pkgs, ... }:

{
  home.stateVersion = "26.05";
  home.username = "mteo";
  home.homeDirectory = "/home/mteo";

  imports = [
  ./home-modules/git.nix
  ./home-modules/zsh.nix
  ./home-modules/ghostty.nix
  ];

  programs.home-manager.enable = true;

# Fin
}
