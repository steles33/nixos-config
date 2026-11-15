{
  config,
  pkgs,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "normal";
      };
      general = {
        detectVersion = false;
      };
      display = {
        separator = "  ";
        brightColor = false;
        key = {
          type = "both-2";
        };
      };
      modules = [
        {
          type = "title";
          format = "{user-name-colored}{#light_red}@{host-name-colored} {#}{cwd}";
        }
        {
          type = "os";
          key = "System       ";
        }
        {
          type = "kernel";
          key = "Kernel       ";
        }
        {
          type = "shell";
          key = "Shell        ";
        }
        {
          type = "uptime";
          key = "Uptime       ";
        }
        {
          type = "wm";
          key = "Desktop      ";
        }
        {
          type = "packages";
          key = "Packages     ";
        }
        fmhyfmhyvdsbvdsf
        {
          type = "memory";
          key = "Memory       ";
        }
        {
          type = "disk";
          key = "Storage (/)  ";
          folders = "/";
        }
        {
          type = "localip";
          key = "Local IP     ";
        }
        {
          type = "publicip";
          key = "Public IP    ";
        }
        {
          type = "colors";
          key = "Colors       ";
          symbol = "circle";
        }
      ];
    };
  };
}
