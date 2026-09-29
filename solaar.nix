{ config, pkgs, ... }:
{
  programs.solaar = {
    enable = true;
    package = pkgs.solaar;
    userService = { 
      enable = true;
      window = "hide";
      batteryIcons = "solaar";
      };
    };
  }