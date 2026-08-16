{config,pkgs,...}:
{
  # programs.git = {
  #   enable = true;
  #   userName = "mteo";
  #   userEmail = "cortinamateo211@gmail.com";
  #
  #   extraConfig = {
  #     safe.directory = "/etc/nixos";
  #   };
  # };
    programs.git = {
      enable = true;
      settings = {
        user.name = "mteo";
        user.email = "cortinamateo211@gmail.com";
        safe.directory = "/etc/nixos";
  };
};
# Fin
}
