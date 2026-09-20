{pkgs, ... }: {
home.username = "steles33";
home.homeDirectory = "/home/steles33";
home.packages = with pkgs; [
  waybar
  fuzzel
  firefox
  vscode
  git
  kitty
];
# programs.sway = {
  # enable = true;
  # config = { terminal = "kitty"; menu = "fuzzel"; startup = [ { command = "waybar"; } ];
  # };
home.stateVersion = "26.05";
}
