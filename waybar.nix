{ config, pkgs, ... }:

{
programs.waybar = {
  enable = true;
  settings = {
    mainBar = {
      position = "top";
      height = 34;
      spacing =20; # gaps between modules
      output = [ "HDMI-A-2" ];
      modules-left = [ "sway/mode" "network" ];
      modules-center = [ "sway/workspaces" "wlr/taskbar" "clock" "mpd" ];
      modules-right = [ "pulseaudio" "bluetooth" "cpu" "memory" "disk" "battery" "tray" ];
      "clock" = {
        interval = 1;
        format = " {:%a %d.%m.%y  %H:%M:%S}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };
      "cpu" = {
        format = " :{usage}%  ";
        tooltip = false;
      };
      "memory" = {
        interval = 30;
        format = ":{}%  ";
      };
      "disk" = {
        interval = 30;
        format = ":{percentage_used}%  ";
      };
      "network" = {
        interval = 1;
        format-wifi = "{signalStrength}%   |  {bandwidthDownBits}   |  {bandwidthUpBits} ";
        format-ethernet = "  {bandwidthDownBits}  {bandwidthUpBits} ";
        tooltip-format = "{essid} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "󰖪";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
      "pulseaudio" = {
        format = "{icon} {volume}%";
        format-bluetooth = "{icon}  {volume}% {format_source}";
        format-muted = "󰝟 muted";
        format-icons = { default = [ "" "" "" ]; };
        on-click = "pwvucontrol";
      };
      "battery" = {
        format = "{icon} {capacity}%";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
      };
    };
  };
  style = ''
    * {
      font-family: monospace, FontAwesome;
      font-size: 22px;
    }
      window#waybar {
        background: rgba(24, 24, 37, 0.95);
        color: #cdd6f4;
      }
      #workspaces button {
        padding: 0 8px;
        color: #a6adc8;
        background: transparent;
        border: none;
      }
      #workspaces button.focused {
        color: #89b4fa;
        background: #313244;
      }
      #clock,
      #network,
      #pulseaudio,
      #battery {
        padding: 0 10px;
      }
  '';
};
}