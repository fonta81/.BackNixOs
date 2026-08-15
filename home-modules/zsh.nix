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
      # clear 
      c = "clear";
      cc = "clear && pokemon-colorscripts -r --no-title";
      # aplicaciones
      y = "yazi";
      gg = "lazygit";
      n = "nvim";
      # pokemon
      pk = "pokemon-colorscripts -r --no-title";
      pkk = "clear && pokemon-colorscripts --no-title -n ";
      #NixOs
      ni = "cd /etc/nixos";
      nz = "nvim /etc/nixos/home-modules/zsh.nix"; 
      nis = "sudo nixos-rebuild switch"; 
      nisf = "sudo nixos-rebuild switch --flake ."; 
      nit = "sudo nixos-rebuild test"; 
      nitf = "sudo nixos-rebuild test --flake . "; 
      nimrd = "sudo nix-collect-garbage -d";
      nimrd15 = "sudo nix-collect-garbage --delete-older-than 15d";
      # niri
      nir = "cd ~/.config/niri/";
    };

    initExtra = ''
      pokemon-colorscripts -r --no-title
    '';
  };
}
