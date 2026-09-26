{ config, pkgs, ... }:
{
  programs.vscode = {
  enable = true;
  package = pkgs.vscode; 
  extensions = with pkgs.vscode-extensions; [
    nix.vscode-nix # This provides the Nix language support
    vscode-langextensions.vscode-python
    # ... other extensions
  ];
  userSettings = {
    "editor.fontSize" = 14;
    # ... other settings
  };
};

}