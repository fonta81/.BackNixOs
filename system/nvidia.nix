{ config, pkgs, ... }:
 {
  #enble nvidia Mateo
  hardware.graphics = {
  enable = true;
  enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
  open = true; 
  modesetting.enable = true;
  nvidiaSettings = true;
  };
  # Fin nvidia Mateo
 }
