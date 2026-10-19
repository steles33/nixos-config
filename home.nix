{config, pkgs, ... }: {
home.username = "steles33";
home.homeDirectory = "/home/steles33";
home.stateVersion = "26.05";
home.packages = with pkgs; [
  firefox
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
  ./modules/home/wm/sway.nix
  ./modules/home/wm/swaylock.nix
  ./modules/home/wm/swayidle.nix
  ./modules/home/wm/waybar.nix
  ./modules/home/theme/wallpaper.nix
  ./modules/home/shell/fish.nix
  ./modules/home/apps/foot.nix
  ./modules/home/apps/fuzzel.nix
  ./modules/home/apps/vscodium.nix
  ./modules/home/apps/keepassxc.nix
  ./modules/home/apps/mc.nix
  ./modules/home/apps/solaar.nix
  ./modules/home/apps/user_directories.nix
  ./modules/fastfetch.nix
  #./modules/home/apps/thunar.nix
];
}
