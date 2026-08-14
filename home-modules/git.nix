{config,pkgs,...}:
{
  programs.git = {
    enable = true;
    userName = "mteo";
    userEmail = "cortinamateo211@gmal.com";

    extraConfig = {
      safe.directory = "/etc/nixos";
    };
  };

# Fin
}
