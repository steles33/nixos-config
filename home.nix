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
  ./swaylock.nix
  ./swayidle.nix
  ./waybar.nix
  ./wallpaper.nix
  ./foot.nix
  ./fuzzel.nix
  ./fish.nix
  ./vscode.nix
  ./keepassxc.nix
  ./mc.nix
  ./solaar.nix
];
}
