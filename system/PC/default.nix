{ pkgs, ... }: {
  # AQUÍ defines el hostname para la PC
  networking.hostName = "pc-escritorio";

  # Cosas exclusivas de la PC de escritorio
  # Por ejemplo, drivers de tarjeta gráfica NVIDIA:
  # services.xserver.videoDrivers = [ "nvidia" ];
}
