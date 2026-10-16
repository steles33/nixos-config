{ config, ... }:

{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = "${config.users.users.steles33.home}/Desktop";
    documents = "${config.users.users.steles33.home}/Documents";
    download = "${config.users.users.steles33.home}/Downloads";
    music = "${config.users.users.steles33.home}/Music";
    pictures = "${config.users.users.steles33.home}/Pictures";
    publicShare = "${config.users.users.steles33.home}/Public";
    templates = "${config.users.users.steles33.home}/Templates";
    videos = "${config.users.users.steles33.home}/Videos";
  };
}
