{config, pkgs, ... }: {
home.username = "steles33";
home.homeDirectory = "/home/steles33";
home.stateVersion = "26.05";
home.packages = with pkgs; [
  waybar
  foot
  fuzzel
  firefox
  vscodium
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
  ./vscodium.nix
  ./keepassxc.nix
  ./mc.nix
  ./solaar.nix
  ./user_directories.nix
  # ./hardware-tweaks.nix
  # ./stylix-nixos.nix
  # ./gtk.nix
];
}
