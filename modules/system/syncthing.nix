{ config, pkgs, ... }:

{
  # 1. Aktiviert das offizielle NixOS Syncthing-Modul sauber für Ihren User
  services.syncthing = {
    enable = true;
    user = "steles33";
    group = "users";
    dataDir = "/home/steles33/.config/syncthing";  # Speicherort der Keys/Config
    configDir = "/home/steles33/.config/syncthing";
    
    # Verhindert, dass NixOS versucht, die veraltete Template-Unit zu bauen
    systemService = false; 
  };

  # 2. Firewall-Ports für die Synchronisation öffnen
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 21027 22000 ];
}
