{ config, pkgs, ... }:

{
  # This is the ONLY line needed for the service.
  # It automatically creates the template and enables the service.
  services.syncthing.enable = true;

  # We disable the global one to prevent the /var/lib crash
  systemd.services.syncthing.enable = false;

  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 21027 ];
}
