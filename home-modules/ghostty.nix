{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    
    # Opciones de Ghostty
    settings = {
      theme = "dankcolors";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 11;
      
      # Forzar a Ghostty a usar Zsh (en Linux por defecto toma la $SHELL del usuario)
      command = "${pkgs.zsh}/bin/zsh";
    };
  };
}
