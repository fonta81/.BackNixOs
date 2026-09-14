{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ 
    vim 
    wget
    xwayland-satellite
    neovim
    zsh
  ];

}
