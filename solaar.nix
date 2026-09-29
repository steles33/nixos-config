{ pkgs, ... }:

{
  # Install the Solaar package
  home.packages = [ pkgs.solaar ];

  # Create a systemd service to start Solaar in the background on login
  systemd.user.services.solaar = {
    Unit = {
      Description = "Solaar Logitech Device Manager";
      After = [ "graphical-session.target" ];
    };
    Service = {
      # --window=hide ensures it starts minimized in the Waybar tray
      ExecStart = "${pkgs.solaar}/bin/solaar --window=hide";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
