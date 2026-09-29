{ config, pkgs, ... }:
{
  options.programs.solaar = {
    enable = true;
    package = pkgs.solaar;
    userService = { 
      enable = true;
      window = "show";
      batteryIcons = {
        type = "symbolic";
        };
      };
    };
  }