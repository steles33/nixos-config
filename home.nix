{pkgs, ... }: {
home.username = "steles33";
home.homeDirectory = "/home/steles33";
home.packages = with pkgs; [
  waybar
  foot
  fuzzel
  firefox
  vscode
  keepassxc
];
wayland.windowManager.sway = {
  enable = true;
  wrapperFeatures.gtk = true;
  config = rec {
    modifier = "Mod4";
    terminal = "foot";
    startup = [ { command = "firefox"; } ];
    input = {
      "*" = {
        xkb_layout = "de";
      };
    };
    fonts.names = [ "monospace" ];
    fonts.size = "16";

  };
};
programs.foot = {
  enable = true;
  settings = {
    main = {
      font = "JetBrainsMono Nerd Font:size=20";
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

home.stateVersion = "26.05";
}
