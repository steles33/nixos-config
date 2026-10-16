{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../../hosts/m920q/hardware-configuration.nix
      ../../modules/system/hardware-tweaks.nix
      ../../modules/system/theme/stylix.nix
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
    kdePackages.okular
    kdePackages.kate
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.breeze-gtk
    lxqt.lximage-qt
    pcmanfm-qt
    vlc
    font-manager
    thunar
    thunar-archive-plugin
    thunar-volman
  ];
  fonts.packages = with pkgs; [
    # nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];

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

    # Logitech Unifying Receiver
  hardware.logitech.wireless.enable = true;
  # services.solaar.enable = true;
  services.udev.packages = [ pkgs.solaar ];

  # Dolphin Open Menu Fix
  environment.etc."xdg/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  # environment.sessionVariables = { QT_QPA_PLATFORMTHEME = "qt5ct"; };
  services.udisks2.enable = true;
  # You can extend Thunar's functionalities by adding to your configuration.nix
  programs.xfconf.enable = true; # If xfce is not used as desktop and therefore xfconf is not enabled, preference changes are discarded. In that case enable the xfconf program manually to be able to save preferences
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
}
