{ config, pkgs, ... }:

{
  # 1. Enable the Syncthing functionality (creates the templates)
  services.syncthing.enable = true;

  # 2. Explicitly kill the generic system-wide service that is crashing
  systemd.services.syncthing.enable = false;

  # 3. Explicitly enable the service for your specific user
  systemd.services."syncthing@steles33" = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
  };

  # Firewall rules for Syncthing
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 21027 ];
}
