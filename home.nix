{ inputs, config, pkgs, ... }:

{
  home.stateVersion = "26.05";
  home.username = "mteo";
  home.homeDirectory = "/home/mteo";

  imports = [
  inputs.dms.homeModules.dank-material-shell
  ./home-modules/git.nix
  ./home-modules/zsh.nix
  ./home-modules/ghostty.nix
  ];

  home.packages = with pkgs; [
    git
    ripgrep
    fd
    unzip
    nodejs_24
    nerd-fonts.jetbrains-mono
    gcc

];
    programs.lazyvim = {
     enable = true;
     extras = {
       lang.nix.enable = true;
     };
    };
  programs.dank-material-shell.enable = true;

  # programs.home-manager.enable = true;

# Fin
}
