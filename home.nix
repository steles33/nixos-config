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
  ./waybar.nix
  ./wallpaper.nix
  ./foot.nix
  ./fuzzel.nix
];
    programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
    '';

    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      ".." = "cd ..";
      rebuild = "sudo nixos-rebuild switch --flake .#m920q";
    };
  };
}
