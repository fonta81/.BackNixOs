
{ config, pkgs, ... }:

{

  #Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.xwayland.enable = true;

  environment.sessionVariables = {
    DISPLAY = ":1";
  };

systemd.user.services.xwayland-satellite = {
    description = "Xwayland Satellite Service";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite :1";
      Restart = "on-failure";
    };
  };
}
