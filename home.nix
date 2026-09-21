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
  
];
wayland.windowManager.sway = {
  enable = true;
  wrapperFeatures.gtk = true;
  config = rec {
    modifier = "Mod4";
    terminal = "foot";
    startup = [ { command = "waybar"; } ];
    input = {
      "*" = {
        xkb_layout = "de";
      };
    };
    fonts.names = [ "monospace" ];
    fonts.size = "16";
    window.commands = [
      {
        criteria = { app_id = "firefox";
        };
        command = "border = none";
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
programs.fuzzel = {
  enable = true;
  settings = {
    main = {
      terminal = "foot";
      width = 30;
      horizontal-dp = false;
      font = "JetBrainsMono Nerd Font:size=12";
    };
    colors = {
      background = "1e1e2e";
      text = "cdd6f4";
      match = "f5e0dc";
      selection = "45475a";
      selection-text = "cdd6f4";
      border = "b4befe";
    };
  };
};

}
