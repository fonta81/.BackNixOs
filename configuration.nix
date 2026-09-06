{ config, pkgs, ... }:

{
  imports = [
    ./core/system/boot.nix
    ./core/system/networking.nix
    ./core/config/locale.nix
    ./core/services/desktop.nix
    ./core/users/user.nix
    ./core/system/nix-settings.nix
    ./core/services/dms.nix
  ];
}
