{ config, pkgs, ... }:
{
  programs.keepassxc = {
    enable = true;
    package = pkgs.keepassxc;
    setting = {
      Browser = {
        Enabled = true;
      };
      GUI = {
        AdvancedSettings = true;
        ApplicationTheme = "dark";
        CompactMode = true;
        HidePasswords = true;
      };
      SSHAgent = {
        Enabled = true;
      };
    };
  };
}