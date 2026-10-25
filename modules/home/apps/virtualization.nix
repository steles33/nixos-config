{ pkgs, ... }: {
  # Enable libvirtd daemon
  virtualisation.libvirtd.enable = true;

  # Enable the Virt-Manager GUI
  programs.virt-manager.enable = true;

  # Install optional but recommended tools for VM management
  home.packages = with pkgs; [
    virt-viewer
    bridge-utils
  ];
}
