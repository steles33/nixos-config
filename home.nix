{config, pkgs, ... }: {
home.username = "steles33";
home.homeDirectory = "/home/steles33";
home.stateVersion = "26.05";
home.packages = with pkgs; [
  waybar
  foot
  fuzzel
  firefox
  vscode
  keepassxc
  wl-clipboard
  grim
  slurp
  swappy
  swaynotificationcenter
  networkmanagerapplet
  pwvucontrol
  blueman
  xfce4-appfinder
];
imports = [
  ./sway.nix
  ./waybar.nix
  ./wallpaper.nix
  ./foot-nix
];
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "monospace:size=18";
        lines = 15;
        auto-select = true;
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
  programs.swaylock = {
    enable = true;

    settings = {
      color = "1e1e2e";
      inside-color = "313244";
      ring-color = "89b4fa";
      text-color = "cdd6f4";
      key-hl-color = "f38ba8";
      bs-hl-color = "eba0ac";

      indicator = true;
      clock = true;
      timestr = "%H:%M";
      datestr = "%A, %B %-d";

      ignore-empty-password = true;
      show-failed-attempts = true;
    };
  };
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
    '';

    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      ".." = "cd ..";
      rebuild = "sudo nixos-rebuild switch";
    };
  };
}
