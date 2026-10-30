{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    user = "steles33";
    dataDir = "/home/steles33/.config/syncthing";
  };

  # The correct way to enable a templated service for a specific user
  systemd.services."syncthing@steles33" = {
    wantedBy = [ "multi-user.target" ];
  };
}
