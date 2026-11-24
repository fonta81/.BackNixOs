{ pkgs, ... }: {

  networking.hostName = "generic";

  services.dbus.enable = true;

  # environment.systemPackages = with pkgs; [
  #   brightnessctl
  # ];
}
