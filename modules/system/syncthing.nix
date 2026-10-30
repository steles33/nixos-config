{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    
    # Run the system service as your user so it has access to your home folder
    user = "steles33";
    
    # Set the data directory to your home folder
    # This stores the config, keys, and index database
    dataDir = "/home/steles33/.config/syncthing";

    openFirewall = true;
  };
}
