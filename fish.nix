{ config, pkgs, ... }:
{
 programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      ".." = "cd ..";
      # rebuild = "sudo nixos-rebuild switch --flake .#m920q";
    };
  };
}