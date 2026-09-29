{ config, pkgs, ... }:

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
  # ... keep your existing home.packages and systemd.user.services here ...

  home.file.".config/solaar/config.yaml".text = ''
    # Solaar Configuration
    # You can find the exact keys by running Solaar once, 
    # changing settings, and looking at the generated file.
    
    # Example settings:
    battery_icons: symbolic
    window_hide_on_start: true
  '';
}
