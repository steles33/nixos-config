{
  config,
  pkgs,
  ...
}: {
  services.syncthing = {
    enable = true;
    user = "steles33";
    group = "users";
    dataDir = "/home/steles33/Sync";
    configDir = "/home/steles33/.config/syncthing";
    openDefaultPorts = true;
    settings = {
      gui.address = "0.0.0.0:8384";
      devices = {
        "t460p" = {
          id = "FJ6O2TN-EIQ2GIC-6ZRCJ24-HZFERK6-DXUWQO5-4QWZJF6-YDAALXL-52OIAAE";
      };
    };
    folders = {
      "Sync" = {
        id = "default";
        path = "~/Sync";
        devices = ["t460p"];
      };
      "skl_personal_cloud" = {
        id = "u3iz4-pkdqh";
        path = "~/Documents/skl_personal_cloud";
        devices = ["t460p"];
      };
    };
  };
  networking.firewall.allowedTCPPorts = [8384];
}
