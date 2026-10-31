{ config, pkgs, ... }:

{
  imports = [
    ../../hosts/m920q/hardware-configuration.nix
    ../../modules/system/hardware-tweaks.nix
    ../../modules/system/stylix.nix
    ../../modules/system/syncthing.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        graceful = true;
      };
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };
    plymouth = {
      enable = true;
      extraConfig = ''
        [Daemon]
        ShowDelay=5
      '';
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [ "quiet" "rd.udev.log_level=3" "rd.systemd.show_status=auto" ];
  };

  networking = {
    hostName = "m920q";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22000 8384 ];
      allowedUDPPorts = [ 22000 ];
    };
  };

  time.timeZone = "Europe/Berlin";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  console.keyMap = "de-latin1-nodeadkeys";
  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };

  users.users.steles33 = {
    isNormalUser = true;
    description = "steles33";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.fish;
  };

  programs = {
    fish.enable = true;
    regreet.enable = true;
    xfconf.enable = true;
    virt-manager.enable = true;
    sway = {
      enable = true;
      extraPackages = with pkgs; [ swaylock swayidle swaybg ];
    };
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment = {
    systemPackages = with pkgs; [
      wget git htop tldr usbutils usb-modeswitch usb-modeswitch-data
      roboto roboto-mono solaar pipewire zip unzip p7zip
      kdePackages.dolphin kdePackages.kio kdePackages.kio-fuse 
      kdePackages.kio-extras kdePackages.qtsvg kdePackages.okular 
      kdePackages.kate kdePackages.breeze kdePackages.breeze-icons 
      kdePackages.breeze-gtk lxqt.lximage-qt pcmanfm-qt vlc 
      font-manager thunar thunar-archive-plugin thunar-volman
    ];
    etc."xdg/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  };

  fonts.packages = with pkgs; [ nerd-fonts.symbols-only ];

  services = {
    openssh.enable = true;
    blueman.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    udev.packages = [ pkgs.solaar ];
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    logitech.wireless.enable = true;
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  virtualisation.libvirtd.enable = true;
  system.stateVersion = "26.05";
}
