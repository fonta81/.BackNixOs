{ inputs, config, pkgs, ... }:

{
  home.stateVersion = "26.05";
  home.username = "mteo";
  home.homeDirectory = "/home/mteo";

  imports = [
  # packages:
  ./home-modules/packages/home-packages.nix
  # dank-material-shell:
  inputs.dms.homeModules.dank-material-shell
  # Aplicaciones:
  ./home-modules/git.nix
  ./home-modules/zsh.nix
  ./home-modules/ghostty.nix
  ./home-modules/lazyvim.nix
  ];

  programs.dank-material-shell.enable = true;

# Fin
}
