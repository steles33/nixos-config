{ config, pkgs, ... }:

{
  # 1. Enable the base functionality
  services.syncthing.enable = true;

  # 2. Disable the generic system-wide service that crashes
  systemd.services.syncthing.enable = false;

  # 3. Use the "systemd.user" or a simple "wantedBy" 
  # to ensure the instance for your user is active.
  # Since the template already exists, we just tell systemd to start it.
  systemd.targets.multi-user.after = [ "syncthing@steles33.service" ];
  
  # This is the cleanest way to ensure the user instance is enabled
  # without overwriting the ExecStart/Unit file settings.
  systemd.services."syncthing@steles33".wantedBy = [ "multi-user.target" ];

  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 21027 ];
}
