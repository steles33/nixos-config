{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings.user = {
      name = "steles33";
      email = "steles33@gmail.com";
    };
  };
}