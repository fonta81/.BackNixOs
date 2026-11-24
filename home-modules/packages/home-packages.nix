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
    antigravity-cli
    bat
    brave
    cava
    davinci-resolve
    github-copilot-cli
    htop
    lavat
    lazyssh
    lazysql
    lazydocker
    lazygit
    lutris
    nodejs
    obsidian
    obs-studio
    opencode
    qbittorrent
    repomix
    ripgrep
    spotify
    vscode
    wine
    yazi

  ];
}
