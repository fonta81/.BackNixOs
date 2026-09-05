{ config, pkgs, ... }:

{
  imports = [
    ./core/boot.nix
    ./core/networking.nix
    ./core/locale.nix
    ./core/desktop.nix
    ./core/user.nix
    ./core/nix-settings.nix
    ./core/dms.nix
  ];
}
