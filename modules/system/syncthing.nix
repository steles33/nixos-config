{ config, pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    user = "steles33";
    
    # This explicitly defines the settings in the config file 
    # so they align with the startup flags
    settings = {
      gui = {
        address = "127.0.0.1:8384";
        #user = "your-chosen-username";
        #password = "your-chosen-password";
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 21027 ];
}
