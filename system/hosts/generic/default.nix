{ pkgs, ... }: {

  networking.hostName = "generic-host";

  services.dbus.enable = true;

  # environment.systemPackages = with pkgs; [
  #   brightnessctl
  # ];
}
