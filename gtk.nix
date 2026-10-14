{config, pkgs, ... }: {
  home-manager.users.steles33 = {
    gtk = {
      enable = true;
      iconTheme = {
        name = "breeze";
        package = pkgs.breeze-icons;
      };
    };
  };
}
