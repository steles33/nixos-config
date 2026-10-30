{ config, pkgs, ... }:

{
  # We still enable the base service to get the package and basic setup
  services.syncthing.enable = true;

  # We define the specific service for steles33 explicitly
  systemd.services."syncthing@steles33" = {
    description = "Syncthing for steles33";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      User = "steles33";
      Group = "steles33";
      Restart = "on-failure";
      ExecStart = "${pkgs.syncthing}/bin/syncthing serve";
      # This ensures the config is stored in your home directory
      Environment = "SYNCTHING_HOME=/home/steles33/.config/syncthing";
    };
  };
}
