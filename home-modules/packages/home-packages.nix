
{ inputs, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Editor & UI fonts
    nerd-fonts.jetbrains-mono

    # Mis packages:
    lazygit
    brave
    fastfetch
    yazi
    spotify
    obsidian
    antigravity-cli
    gemini-cli
    github-copilot-cli
    cava
    lavat
    lutris

    ];
}
