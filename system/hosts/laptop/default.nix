{ pkgs, ... }: {

  networking.hostName = "laptop";


  services.dbus.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
        General = {
          Enable = "Source,Sink,Media,Socket"; 
          Experimental = true; 
        };
    };
  };

  # environment.systemPackages = with pkgs; [
  #   brightnessctl # Control de brillo de pantalla
  # ];
}
