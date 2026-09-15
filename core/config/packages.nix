{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ 
    wget
    xwayland-satellite
    neovim
  ];

}
