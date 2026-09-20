{pkgs, ... }: {
home.username = "steles33";
home.homeDirectory = "/home/steles33";
home.packages = with pkgs; [
  waybar
  fuzzel
  firefox
  vscode
  foot
  keepassxc
];
wayland.windowManager.sway = {
  enable = true;
  wrapperFeatures.gtk = true;
  config = rec {
    modifier = "Mod4";
    terminal = "foot";
    startup = [ { command = "firefox"; } ];
    input = {
      "*" = {
        xkb_layout = "de";
      };
    };
    fonts.names = [ "monospace" ];
    fonts.size = "16";
  };
};
home.stateVersion = "26.05";
}
