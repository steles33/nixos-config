{config, pkgs, ... }: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "breeze";
      package = pkgs.kdePackages.breeze-icons;
      };
    };
}
