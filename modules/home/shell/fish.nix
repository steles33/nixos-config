{ config, pkgs, ... }:
{
 programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # fastfetch
      set fish_greeting # Disable greeting
      function fish_prompt
        set_color white
        date "[%H:%M:%S] "
        set_color blue
        printf "%s" (whoami)"@"(hostname -s)" "
        set_color green
        printf "%s" (pwd)
        set_color red
        printf '%s' (fish_git_prompt)
        set_color normal
        printf "\n> "
      end  
    '';
    shellAliases = {
      ll = "ls -lh";
      la = "ls -lha";
      ".." = "cd ..";
      gs = "git status";
      gitupd = "git add . && git commit -m \"update\" && git push && git status";
      rebuild = "sudo nixos-rebuild switch --flake .#m920q";
    };
  };
}