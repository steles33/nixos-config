{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    user = "steles33";
    dataDir = "/home/steles33/.config/syncthing";
  };

  # This is the correct way to "activate" the template for a specific user
  # without overwriting the service definition.
  systemd.WantedTargets = [ "syncthing@steles33.service" ];
}
