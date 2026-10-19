{ config, pkgs, ... }:
{
  programs.fastfetch = {
  enable = true;
  # equals the following fastfetch example: cat /nix/store/cp99di2yx0ylj1vldxarh7hdvhlmlq1y-fastfetch-2.63.1/share/fastfetch/presets/examples/32.jsonc
  settings = {
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "type": "small"
    },
    "general": {
        "detectVersion": false
    },
    "display": {
        "separator": "  ",
        "brightColor": false,
        "key": {
            "type": "both-2"
        }
    },
    "modules": [
        {
            "type": "title",
            "format": "{user-name-colored}{#light_red}@{host-name-colored} {#}{cwd}"
        },
        {
            "type": "os",
            "key": "System       "
        },
        {
            "type": "kernel",
            "key": "Kernel       "
        },
        {
            "type": "shell",
            "key": "Shell        "
        },
        {
            "type": "uptime",
            "key": "Uptime       "
        },
        {
            "type": "wm",
            "key": "Desktop      "
        },
        {
            "type": "memory",
            "key": "Memory       "
        },
        {
            "type": "disk",
            "key": "Storage (/)  ",
            "folders": "/"
        },
        {
            "type": "colors",
            "key": "Colors       ",
            "symbol": "circle"
        }
    ];
  };
};
}