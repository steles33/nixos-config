{ pkgs, ... }:

{
  # We disable the broken module and create the service manually
  services.swayidle.enable = false;

  systemd.user.services.swayidle = {
    Unit = {
      Description = "Sway Idle Daemon";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = pkgs.lib.mkForce ''
        ${pkgs.swayidle}/bin/swayidle \
          -w timeout 300 '${pkgs.swaylock}/bin/swaylock' \
          -w timeout 600 'swaymsg "output * dpms off"' \
          -w timeout 900 'systemctl suspend' \
          -w before-sleep '${pkgs.swaylock}/bin/swaylock'
      '';
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
