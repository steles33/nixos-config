{ config, pkgs, ... }:
{
  programs.vscode = {
  enable = true;
  package = pkgs.vscode; 
  profiles.default = {
    extensions = with pkgs.vscode-extensions; [ jnoortheen.nix-ide ];
    userSettings = {
      # "workbench.colorTheme" = "Light 2026";
      "editor.fontSize" = 20;
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font Mono'";
      };
    };
  };
}
}