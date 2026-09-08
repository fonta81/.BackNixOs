{ config, pkgs, ... }:

{
  # Enable networking (nmtui && nmcli)
  networking.networkmanager.enable = true;

  # Enable the firewall
  networking.firewall.enable = true;
}
