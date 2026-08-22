{ pkgs, ... }: {

  networking.hostName = "laptop";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # environment.systemPackages = with pkgs; [
  #   brightnessctl # Control de brillo de pantalla
  # ];
}
