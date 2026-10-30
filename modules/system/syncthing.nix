{ config, pkgs, ... }:

{
  services.syncthing.enable = true;

  systemd.services."syncthing@steles33" = {
    description = "Syncthing for steles33";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      User = "steles33";
      # Removed Group = "steles33" to avoid 216/GROUP errors
      Restart = "on-failure";
      RestartSec = "5s"; 
      ExecStart = "${pkgs.syncthing}/bin/syncthing serve";
      Environment = "SYNCTHING_HOME=/home/steles33/.config/syncthing";
    };
  };
}
