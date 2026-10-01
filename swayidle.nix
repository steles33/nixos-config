{ config, pkgs, ... }:
{
  services.swayidle = {
  enable = true;
  events = {
    timeout = [
      { 
        timeout = 300; 
        command = "${pkgs.swaylock}/bin/swaylock"; 
      }
      { 
        timeout = 600; 
        command = "swaymsg 'output * dpms off'"; 
      }
      { 
        timeout = 900; 
        command = "systemctl suspend"; 
      }
    ];
    before_sleep = [
      { 
        command = "${pkgs.swaylock}/bin/swaylock"; 
      }
    ];
  };
};

}