{ config, pkgs, ... }:

{
  imports = [
    # system
    ./core/system/boot.nix
    ./core/system/networking.nix
    ./core/system/nix-settings.nix
    # config
    ./core/config/locale.nix
    ./core/config/packages.nix
    # services
    ./core/services/desktop.nix
    ./core/services/dms.nix
    ./core/services/steam.nix
    # user
    ./core/users/user.nix
  ];
}
