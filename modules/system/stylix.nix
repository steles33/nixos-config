{ config, pkgs, ... }:
{
    # stylix module

    stylix = {
    enable = true;
    #polarity = "light";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";
    polarity = "dark";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokio-night.yaml";
    #manual colors of catpuccin latte
    # base16Scheme = {
      #base00 = "#eff1f5"; # base
      #base01 = "#e6e9ef"; # mantle
      #base02 = "#ccd0da"; # surface0
      #base03 = "#bcc0cc"; # surface1
      #base04 = "#acb0be"; # surface2
      #base05 = "#4c4f69"; # text
      #base06 = "#dc8a78"; # rosewater
      #base07 = "#7287fd"; # lavender
      #base08 = "#d20f39"; # red
      #base09 = "#fe640b"; # peach
      #base0A = "#df8e1d"; # yellow
      #base0B = "#40a02b"; # green
      #base0C = "#179299"; # teal
      #base0D = "#1e66f5"; # blue
      #base0E = "#8839ef"; # mauve
      #base0F = "#dd7878"; # flamingo
    #};
    opacity = {
      applications = 1.0;
      terminal = 0.7;
      desktop = 0.7;
      popups = 1.0;
    };
    targets.plymouth = { enable = true; logo = ../../NixOS.png; };
    icons = { enable = true; package = pkgs.kdePackages.breeze-icons; dark = "breeze-dark"; light = "breeze"; };
    cursor = { package = pkgs.kdePackages.breeze-icons; name = "breeze_cursors"; size = 24; };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.roboto-mono;
        name = "RobotoMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.roboto;
        name = "Roboto";
      };
      serif = {
        package = pkgs.roboto;
        name = "Roboto";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 14;
        terminal = 15;
        desktop = 14;
        popups = 16;
      };
    };
  };
}