{ pkgs, ... }:

{
  services.swayidle =
   let
    lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
    display = status: "${pkgs.sway}/bin/swaymsg 'output * power ${status}'";
  in
{
  enable = true;
  timeouts = [
    {
      timeout = 15; # in seconds
      command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
    }
    {
      timeout = 20;
      command = lock;
    }
    {
      timeout = 25;
      command = display "off";
      resumeCommand = display "on";
    }
    {
      timeout = 30;
      command = "${pkgs.systemd}/bin/systemctl suspend";
    }
  ];
  events = {
      "before-sleep" = "${display "off"}; ${lock}";
      "after-resume" = display "on";
      lock = "${display "off"}; ${lock}";
      unlock = display "on";
    };
  };
}
