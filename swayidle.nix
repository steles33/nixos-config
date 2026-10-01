{ pkgs, ... }:

{
  services.swayidle = {
    enable = true;
    events = [
      { 
        event = "timeout"; 
        command = "swayidle -w timeout 300 '${pkgs.swaylock}/bin/swaylock'"; 
      }
      { 
        event = "timeout"; 
        command = "swayidle -w timeout 600 'swaymsg \"output * dpms off\"'"; 
      }
      { 
        event = "timeout"; 
        command = "swayidle -w timeout 900 'systemctl suspend'"; 
      }
      { 
        event = "before-sleep"; 
        command = "${pkgs.swaylock}/bin/swaylock"; 
      }
    ];
  };
}
