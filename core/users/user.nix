{ config, pkgs, ... }:

{
  users.users."mteo" = {
    isNormalUser = true;
    description = "Mteo";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };

  # iniciar zsh
  programs.zsh.enable = true;
}
