{ config, pkgs, ... }:

{
  # 1. Enable the base functionality (creates the template)
  services.syncthing.enable = true;

  # 2. Disable the global generic service to prevent the /var/lib crash
  systemd.services.syncthing.enable = false;

  # 3. CORRECTLY enable the user-specific instance.
  # We use .wantedBy to APPEND this setting instead of replacing the whole service.
  systemd.services."syncthing@steles33".wantedBy = [ "multi-user.target" ];

  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 21027 ];
}
