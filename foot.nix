{ config, pkgs, ...}:
{
  programs.foot = {
  enable = true;
  settings = {
    main = {
      font = "JetBrainsMono Nerd Font:size=16";
      pad = "2x2";
    };
    colors-dark = {
      alpha = 0.7;
      background = "1e1e2e";
      foreground = "cdd6f4";
    };
    cursor = {
      style = "block";
      blink = "yes";
    };
  };
};
}