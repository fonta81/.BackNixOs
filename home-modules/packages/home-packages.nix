
{ inputs, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # lazyVim
    git
    ripgrep
    fd
    unzip
    nodejs_24
    nerd-fonts.jetbrains-mono
    gcc
    # Mis packages:
    lazygit
    brave
    fastfetch
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
    lutris
    ];
}
