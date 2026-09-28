{ config, pkgs, ... }:
{
programs.waybar = {
  enable = true;
  settings = {
    mainBar = {
      position = "top";
      height = 34;
      spacing =14; # gaps between modules
      output = [ "HDMI-A-2" ];
      modules-left = [ "sway/mode" "custom/appmenu" "network" ];
      modules-center = [ "clock" "sway/workspaces" "wlr/taskbar" "mpd" ];
      modules-right = [ "cpu" "memory" "disk" "pulseaudio" "battery" "tray" "custom/power"];
      "custom/appmenu" = {
        tooltip = false;
        format = " ";
        on-click = "xfce4-appfinder";
      };
      "network" = {
        interval = 1;
        format-wifi = "  {signalStrength}% {bandwidthDownBits}  {bandwidthUpBits} ";
        format-ethernet = "  {bandwidthDownBits}  {bandwidthUpBits} ";
        tooltip-format = "{essid} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "󰖪";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
      "clock" = {
        interval = 1;
        format = "  {:%H:%M:%S}";
        format-alt = "  {:%a %d.%m.%y - CW %V}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };
      "wlr/taskbar" = {
        format = "{icon}";
        icon-size = 20;
        tooltip = true;
        tooltip-format = "{title}";
        on-click = "activate";
        on-click-middle = "close";
        activate-first = "false";
      };
      "cpu" = {
        format = ": {usage}% ";
        tooltip = false;
      };
      "memory" = {
        interval = 30;
        format = ": {}%";
      };
      "disk" = {
        interval = 30;
        format = ": {percentage_used}%";
      };
      "pulseaudio" = {
        format = "{icon}  {volume}%";
        format-bluetooth = "{icon}  {volume}%";
        format-muted = "󰝟 muted";
        format-icons = [ "" "" "" "" ];
        on-click = "pwvucontrol";
      };
      "battery" = {
        format = "{icon} {capacity}%";
        format-icons = [ "" "" "" "" "" ];
      };
      "custom/power" = {
        format = "󰍃 ";
        tooltip = false;
        on-click = "swaynag -t warning -m 'Exit Sway?' -B 'Yes' 'swaymsg exit'";
      };
    };
  };
  style = ''
    * {
      font-family: Roboto, FontAwesome;
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