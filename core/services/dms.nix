{ config, pkgs, ... }:

{
  # dank-mateiar-shell:
  programs.niri.enable = true;
  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true;             # servicio systemd para autoarranque
      restartIfChanged = true;   # reinicia dms.service si cambia la config
    };

    enableSystemMonitoring = true; # widgets de monitoreo (dgop)
    enableVPN = true;              # gestión de VPN
    enableDynamicTheming = true;   # theming según el wallpaper (matugen)
    enableAudioWavelength = true;  # visualizador de audio (cava)
    enableCalendarEvents = true;   # integración de calendario (khal)
  };

  # Dank Greeter:
  programs.dank-material-shell.greeter = {
    enable = true;

    compositor = {
      name = "niri";
      customConfig = ''
      '';
    };

    configHome = "/home/mteo";

    configFiles = [
      "/home/mteo/.config/DankMaterialShell/settings.json"
    ];

    logs = {
      save = true; 
      path = "/tmp/dms-greeter.log";
    };

    quickshell.package = pkgs.quickshell;
  };
}
