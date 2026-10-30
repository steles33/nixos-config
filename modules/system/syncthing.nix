
{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    user = "steles33";
    group = "users";

    dataDir = "/home/steles33/.config/syncthing";
    configDir = "/home/steles33/.config/syncthing";

    openDefaultPorts = true;
  };
}

