{ config, pkgs, ... }:

{
  # Enable networking (nmtui && nmcli)
  networking.networkmanager.enable = true;
}
