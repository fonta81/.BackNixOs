{ config, lib, pkgs, ... }:
{
  # Necesario para renderizado gráfico moderno (Vulkan/OpenGL) en Wayland
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Obligatorio para Wayland: habilita KMS (kernel modesetting)
    modesetting.enable = true;

    # OBLIGATORIO para RTX 50 (Blackwell): el módulo propietario clásico
    # ya no es compatible con esta arquitectura.
    open = true;

    # Recomendado dejar en false salvo que tengas problemas de suspensión
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    nvidiaSettings = true;

    # Usa el driver "stable" más reciente disponible en tu canal de nixpkgs
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
