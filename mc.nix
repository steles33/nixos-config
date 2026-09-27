{ config, pkgs, ... }:
{
  programs.mc = {
    enable = true;
    package = pkgs.mc;
    settings = {
      Panels = {
        show_dot_files = false;
        use_internal_edit = true;
      };
    };
  };
}