{ config, pkgs, ... }:
{
  programs.vscode = {
  enable = true;
  package = pkgs.vscode; 
  profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide # This provides the Nix language support
      # ... other extensions
    ];
    userSettings = {
      # "workbench.colorTheme" = "Light 2026";
      "editor.fontSize" = 20;
      # ... other settings
    };
  }
};
}