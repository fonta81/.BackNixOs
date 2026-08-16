{ pkgs, ... }: {
  networking.hostName = "laptop";

  # Cosas exclusivas de la laptop
  # services.tlp.enable = true; # Ahorro de batería
  # environment.systemPackages = with pkgs; [
  #   brightnessctl # Control de brillo de pantalla
  ];
}
