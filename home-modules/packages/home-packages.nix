{
  inputs,
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    # Editor & UI fonts
    nerd-fonts.jetbrains-mono

    # Mis packages:
    lazygit
    brave    
    yazi
    spotify
    obsidian
    antigravity-cli
    github-copilot-cli
    cava
    lavat
    lutris
    lazyssh
    repomix
    nodejs
    opencode

  ];
}
