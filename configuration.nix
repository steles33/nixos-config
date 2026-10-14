
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.graceful = true;

  # Plymouth
  boot = {
    plymouth = {
      enable = true;
      # theme = "bgrt";
      extraConfig = ''
        [Daemon]
        ShowDelay=5
      '';
    };
    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 3;
  };

  # Enable networking + Define your hostname
  networking.networkmanager.enable = true;
  networking.hostName = "m920q";

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."steles33" = {
    isNormalUser = true;
    description = "steles33";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };
  
  # Define the shell
  programs.fish.enable = true;
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Sway
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      swaybg
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    mc
    htop
    fastfetch
    tldr
    usbutils
    usb-modeswitch
    usb-modeswitch-data
    roboto
    roboto-mono
    solaar
    pipewire
    zip
    unzip
    p7zip
    kdePackages.dolphin # This is the actual dolphin package
    kdePackages.kio # needed since 25.11
    kdePackages.kio-fuse #to mount remote filesystems via FUSE
    kdePackages.kio-extras #extra protocols support (sftp, fish and more)
    kdePackages.qtsvg # Dolphin Icon Fix
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.breeze-gtk
    lxqt.lximage-qt
    pcmanfm-qt
    vlc
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];

  # stylix module

    stylix = {
    enable = true;
    polarity = "light";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    opacity.terminal = 0.75;
    targets.plymouth = { enable = true; logo = ./NixOS.png; };
    icons = { enable = true; package = pkgs.kdePackages.breeze-icons; dark = "breeze-dark"; light = "breeze"; };
    cursor = { package = pkgs.kdePackages.breeze-icons; name = "breeze_cursors"; size = 24; };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.roboto-mono;
        name = "RobotoMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.roboto;
        name = "Roboto";
      };
      serif = {
        package = pkgs.roboto;
        name = "Roboto";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 14;
        terminal = 14;
        desktop = 14;
        popups = 16;
      };
    };
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # NixOS State Version
  system.stateVersion = "26.05"; # Did you read the comment?

  # NixOS settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Allowing sway to work (enabling Polkit)
  security.polkit.enable = true;
  
  # Greeter
  programs.regreet.enable = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Optional GUI for pairing and managing devices
  services.blueman.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;

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

  # Logitech Unifying Receiver
  hardware.logitech.wireless.enable = true;
  # services.solaar.enable = true;
  services.udev.packages = [ pkgs.solaar ];

  # Dolphin Open Menu Fix
  environment.etc."xdg/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  environment.sessionVariables = { QT_QPA_PLATFORMTHEME = "qt5ct"; };
  services.udisks2.enable = true;
}
