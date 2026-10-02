{ config, pkgs, ... }:
{
    programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "monospace:size=16";
        lines = 15;
        auto-select = false;
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