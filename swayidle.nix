{ pkgs, ... }:

{
  services.swayidle = {
    enable = true;
    events = [
      { 
        event = "timeout"; 
        timeout = 300; 
        command = "${pkgs.swaylock}/bin/swaylock"; 
      }
      { 
        event = "timeout"; 
        timeout = 600; 
        command = "swaymsg 'output * dpms off'"; 
      }
      { 
        event = "timeout"; 
        timeout = 900; 
        command = "systemctl suspend"; 
      }
      { 
        event = "before-sleep"; 
        command = "${pkgs.swaylock}/bin/swaylock"; 
      }
    ];
  };
}
