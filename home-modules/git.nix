{config,pkgs,...}:
{
  programs.git = {
    enable = true;
    userName = "mteo";
    userEmail = "cortinamateo211@gmail.com";

    extraConfig = {
      safe.directory = "/etc/nixos";
    };
  };

# Fin
}
