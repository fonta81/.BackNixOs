{ config, pkgs, ... }:

{
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
  ];

  #Steam
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
  };

  programs.xwayland.enable = true;
}
