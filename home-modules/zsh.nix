{ config, pkgs, ... }:

{
  # Instalamos los paquetes necesarios (pokemon-colorscripts, yazi, etc.)
  home.packages = [
    pkgs.pokemon-colorscripts
    pkgs.yazi
  ];

  # Variables de entorno ($PATH y editores por defecto)
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

  # Configuración de Zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Plugins nativos integrados por Home Manager
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Configuración del Historial
    history = {
      size = 1000;
      save = 1000;
      path = "${config.home.homeDirectory}/.histfile";
    };

    # Oh My Zsh
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };

    # Mis Aliases
    shellAliases = {
      c = "clear";
      cc = "clear && pokemon-colorscripts -r --no-title";
      y = "yazi";
      gg = "lazygit";
      ni = "cd /etc/nixos";
      nz = "sudo nvim /etc/nixos/home-modules/zsh.nix"; 
      n = "nvim";
      pk = "pokemon-colorscripts -r --no-title";
      pkk = "pokemon-colorscripts -n";
      nis = "sudo nixos-rebuild switch"; 
      nit = "sudo nixos-rebuild test"; 
    };

    initExtra = ''
      pokemon-colorscripts -r --no-title
    '';
  };
}
