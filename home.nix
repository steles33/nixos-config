{pkgs, ... }: {
home.username = "steles33";
home.homeDirectory = "/home/steles33";
home.packages = with pkgs; [
  waybar
  fuzzel
  firefox
  vscode
  foot
];
wayland.windowManager.sway = {
  enable = true;
  wrapperFeatures.gtk = true;
  config = rec {
    modifier = "Mod4";
    terminal = "foot";
    startup = [
      { command = "firefox"; }
    ];
  };
};
home.stateVersion = "26.05";
}
