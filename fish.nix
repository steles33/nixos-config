{ config, pkgs, ... }:
{
 programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      function fish_prompt
        # set_color white
        # date "+[%H:%M:%S] "
        set_color blue
        printf "%s" (whoami)"@"(hostname -s)" "
        set_color green
        printf "%s" (prompt_pwd)
        set_color normal
        printf "\n> "
      end  
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