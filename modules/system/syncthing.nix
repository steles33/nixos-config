{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    user = "steles33";
    dataDir = "/home/steles33/.config/syncthing";
  };

  # This tells systemd to actually start the instance for steles33
  systemd.services."syncthing@steles33" = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
  };
}
