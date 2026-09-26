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
      # gitupd = "git add . && git commit -m "update" && git status"
      # rebuild = "sudo nixos-rebuild switch --flake .#m920q";
    };
  };
}