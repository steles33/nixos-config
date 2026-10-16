{ config, pkgs, ... }:
{
  # USB-Mode switch setting for external UBS-Bluetooth-Controller
  systemd.services.usb-modeswitch-bluetooth = {
  description = "Switch USB Bluetooth Controller Mode";
  wantedBy = [ "multi-user.target" ];
  serviceConfig = {
    Type = "oneshot";
    ExecStart = "${pkgs.usb-modeswitch}/bin/usb_modeswitch -KW -v 0bda -p 1a2b";
    RemainAfterExit = true;
    };
  };
}