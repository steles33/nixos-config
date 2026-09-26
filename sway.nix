{ config, pkgs, ... }:
{
  wayland.windowManager.sway = {
  enable = true;
  wrapperFeatures.gtk = true;
  config = rec {
    modifier = "Mod4";
    terminal = "foot";
    menu = "fuzzel";
    keybindings = {
        # Add or replace bindings
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+d" = "exec ${menu}";
        "${modifier}+Shift+d" = "exec xfce4-appfinder";
        "${modifier}+Shift+q" = "kill";

        # Apps
        "${modifier}+i" = "exec firefox";
        "${modifier}+c" = "exec thunderbird";
        "${modifier}+n" = "exec signal-desktop";
        "${modifier}+o" = "exec dolphin";
        "${modifier}+k" = "exec krusader --left ~ --right ~";
        "${modifier}+m" = "exec elisa";

        # Screenshots
        "${modifier}+p" = "exec grim -g \"$(slurp)\" - | swappy -f -";

        # Notifications
        "${modifier}+Shift+n"= "exec swaync-client -t -sw";

        # Lock
        "${modifier}+l" = "exec swaylock -f -c 1e1e2e";

        # Reload / Restart/ Exit
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'Exit Sway?' -B 'Yes' 'swaymsg exit'";

        # Splitting + Layout
        "${modifier}+h" = "splith";
        "${modifier}+v" = "splitv";
        "${modifier}+s" = "layout stacking";
        "${modifier}+t" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        # Fullscreen + Floating
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+space" = "focus mode toggle";
        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+a" = "focus parent";

        # Move focus
        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";

        # Move windows
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";

        # Workspaces
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";

        # Resize Mode
        "${modifier}+r" = "mode resize";
        modes = {
          resize = {
          h = "resize shrink width 10 px";
          j = "resize grow height 10 px";
          k = "resize shrink height 10 px";
          l = "resize grow width 10 px";

          Left = "resize shrink width 10 px";
          Down = "resize grow height 10 px";
          Up = "resize shrink height 10 px";
          Right = "resize grow width 10 px";

          Escape = "mode default";
          Return = "mode default";
        };
      };

        # Media keys
        "XF86AudioRaiseVolume" =
          "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" =
          "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" =
          "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };
    startup = [
        # {
        #   command = "swaybg -i ~/Pictures/NixOS-Gradient-grey.png -m fill";
        #   always = true;
        # }
        {
          command = "blueman-applet";
          always = true;
        }
      ];
    bars = [
        {
          command = "waybar";
        }
      ];  
    input = {
      "*" = {
        xkb_layout = "de";
      };
    };
    fonts.names = [ "monospace" ];
    fonts.size = "16";
    window.commands = [
      { criteria = { app_id = "firefox"; };
          command = "border none"; 
          }
      {  criteria = { app_id = "xfce4-appfinder"; }; 
          command = "floating enable, resize set width 700 px height 500 px, move position center"; 
          }
    ];
  };
    extraConfig = ''
    # Tiled windows: no border or title bar
    default_border pixel 5
    
    # Floating windows: show the normal title bar
    default_floating_border normal
    
    # Gaps
    gaps inner 10
    gaps outer 5

  '';
};
}