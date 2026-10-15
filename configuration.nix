{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hardware-tweaks.nix
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
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.breeze-gtk
    lxqt.lximage-qt
    pcmanfm-qt
    vlc
    font-manager
  ];
  fonts.packages = with pkgs; [
    # nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];

  # stylix module

    stylix = {
    enable = true;
    #polarity = "light";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";
    polarity = "dark";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokio-night.yaml";
    #manual colors of catpuccin latte
    # base16Scheme = {
      #base00 = "#eff1f5"; # base
      #base01 = "#e6e9ef"; # mantle
      #base02 = "#ccd0da"; # surface0
      #base03 = "#bcc0cc"; # surface1
      #base04 = "#acb0be"; # surface2
      #base05 = "#4c4f69"; # text
      #base06 = "#dc8a78"; # rosewater
      #base07 = "#7287fd"; # lavender
      #base08 = "#d20f39"; # red
      #base09 = "#fe640b"; # peach
      #base0A = "#df8e1d"; # yellow
      #base0B = "#40a02b"; # green
      #base0C = "#179299"; # teal
      #base0D = "#1e66f5"; # blue
      #base0E = "#8839ef"; # mauve
      #base0F = "#dd7878"; # flamingo
    #};
    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 0.7;
      popups = 1.0;
    };
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
        terminal = 15;
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

    # Logitech Unifying Receiver
  hardware.logitech.wireless.enable = true;
  # services.solaar.enable = true;
  services.udev.packages = [ pkgs.solaar ];

  # Dolphin Open Menu Fix
  environment.etc."xdg/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
  # environment.sessionVariables = { QT_QPA_PLATFORMTHEME = "qt5ct"; };
  services.udisks2.enable = true;
}
