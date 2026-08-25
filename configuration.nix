{ config, pkgs, ... }:

{
  imports = [];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;



  # Enable networking
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "America/Bogota";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_MX.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CO.UTF-8";
    LC_IDENTIFICATION = "es_CO.UTF-8";
    LC_MEASUREMENT = "es_CO.UTF-8";
    LC_MONETARY = "es_CO.UTF-8";
    LC_NAME = "es_CO.UTF-8";
    LC_NUMERIC = "es_CO.UTF-8";
    LC_PAPER = "es_CO.UTF-8";
    LC_TELEPHONE = "es_CO.UTF-8";
    LC_TIME = "es_CO.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };


  users.users."mteo" = {
    isNormalUser = true;
    description = "Mteo";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };



  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ 
    vim 
    wget
    neovim
    lazygit
    brave
    fastfetch
    zsh
    ghostty
    yazi
    spotify
    obsidian
    antigravity-cli
    gemini-cli
    github-copilot-cli
    go
    cava
    lavat
  ];# qwe
  
  xdg.terminal-exec = {
  enable = true;
  settings.default = [
  "com.mitchellh.ghostty.desktop"
  ];
  };
  


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.openssh = {
  enable = false;
  settings = {
    PasswordAuthentication = false;
    PermitRootLogin = "no";
    KbdInteractiveAuthentication = false;
  };
};


  system.stateVersion = "26.05";

  # MIS CONFIG mateo

  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # iniciar zsh
  programs.zsh.enable = true;

  # home-manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  # Eliminar basura de mas de 15d
  nix.gc = {
  automatic = true;
  dates = "weekly"; 
  options = "--delete-older-than 15d";
  };
  # dms:
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

}
