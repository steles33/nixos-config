{ config, pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    user = "steles33"; # Matches your username in your config
    dataDir = "/home/steles33/Sync";
  };
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 21027 ];
}
