{ config, pkgs, ... }:
{
  programs.swaylock = {
    enable = true;

    settings = {
      # color = "1e1e2e";
      # inside-color = "313244";
      # ring-color = "89b4fa";
      # text-color = "cdd6f4";
      # key-hl-color = "f38ba8";
      # bs-hl-color = "eba0ac";

      indicator = true;
      clock = true;
      timestr = "%H:%M";
      datestr = "%A, %B %-d";

      ignore-empty-password = true;
      show-failed-attempts = true;
    };
  };
}