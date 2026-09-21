{config, pkgs, ... }: {
home.username = "steles33";
home.homeDirectory = "/home/steles33";
home.stateVersion = "26.05";
home.packages = with pkgs; [
  waybar
  foot
  fuzzel
  firefox
  vscode
  keepassxc
  wl-clipboard
  grim
  slurp
  swappy
  swaynotificationcenter
  networkmanagerapplet
  pwvucontrol
  blueman
];
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

        # Media keys
        "XF86AudioRaiseVolume" =
          "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" =
          "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" =
          "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };
    startup = [
        {
          command = "swaybg -i ~/Pictures/NixOS-Gradient-grey.png -m fill";
          always = true;
        }
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
      {
        criteria = {
          app_id = "firefox";
        };
        command = "border none";
      }
    ];
  };
};
programs.foot = {
  enable = true;
  settings = {
    main = {
      font = "JetBrainsMono Nerd Font:size=18";
      pad = "2px";
    };
    colors = {
      alpha = 0.9;
      background = "1e1e2e";
      foreground = "cdd6f4";
    };
    cursor = {
      color = "f5e0dc";
      style = "block";
    };
  };
};
programs.waybar = {
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 34;
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "sway/window" ];
      modules-right = [ "pulseaudio" "network" "cpu" "memory" "clock" "tray" ];

      "clock" = {
        format = "{:%H:%M}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };
    };
  };
  style = ''
    window#waybar {
      background: rgba(43, 48, 59, 0.5);
      color: #ffffff;
    }
    #clock {
      padding: 0 10px;
    }
  '';
};
#programs.fuzzel = {
#  enable = true;
#  settings = {
#    main = {
#      terminal = "foot";
#      width = 30;
#      horizontal-dp = false;
#      font = "JetBrainsMono Nerd Font:size=12";
#    };
#    colors = {
#      background = "1e1e2e";
#      text = "cdd6f4";
#      match = "f5e0dc";
#      selection = "45475a";
#      selection-text = "cdd6f4";
#      border = "b4befe";
#    };
#  };
#};
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "monospace:size=18";
        lines = 15;
        auto-select = true;
      };
      colors = {
        background = "14161Be5";
        text = "F5F5F5FF";
        selection-match = "A2D6F9ff";
        match = "A2D6F9ff";
        selection = "4F5258ff";
        selection-text = "F5F5F5FF";
        border = "A1A1A1FF";
      };
      border = {
        radius = 5;
        width = 4;
      };
    };
  };
}
