
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
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];

  # stylix module

    stylix = {
    enable = true;

    #polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    #targets = {
    #foot.enable = true;
    #sway.enable = true;
    #swaylock.enable = true;
    #waybar.enable = true;
    #fuzzel.enable = true;
    #};

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      sansSerif = {
        package = pkgs.roboto;
        name = "Roboto";
      };

      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 15;
        terminal = 15;
        desktop = 15;
        popups = 15;
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
}
