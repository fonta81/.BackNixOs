{ pkgs, ... }: {

  networking.hostName = "laptop";


  services.dbus.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
        General = {
          Enable = "Source,Sink,Media,Socket"; # Asegura compatibilidad con audio
          Experimental = true; # Habilita funciones avanzadas (como ver batería de dispositivos)
        };
    };
  };

  # environment.systemPackages = with pkgs; [
  #   brightnessctl # Control de brillo de pantalla
  # ];
}
