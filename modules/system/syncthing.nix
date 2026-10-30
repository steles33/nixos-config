{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    user = "steles33";
    dataDir = "/home/steles33/.config/syncthing";
  };

  systemd.user.services.syncthing.enable = false;
  };
}
