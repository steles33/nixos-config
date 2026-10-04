{ config, pkgs, ... }:

let
  # Reference the wallpaper from the nixos-artwork package
  # Available options: simple-blue, simple-red, binary-blue, binary-black, waterfall, watersplash, etc.
  wallpaperPath = "${pkgs.nixos-artwork.wallpapers.simple-light-gray}/share/backgrounds/nixos/nix-wallpaper-simple-light-gray.png";
in

{
  # Install the wallpaper utility
  home.packages = [
    pkgs.swaybg
  ];

  # Configure Sway to launch swaybg on startup
  wayland.windowManager.sway = {
    enable = true;
    config = {
      startup = [
        {
          # -i specifies the image path, -m fill scales the image to fit the screen
          command = "${pkgs.swaybg}/bin/swaybg -i ${wallpaperPath} -m fill";
          always = true;
        }
      ];
    };
  };
}
