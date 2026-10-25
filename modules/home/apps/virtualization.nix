{ pkgs, ... }: {
  # Enable libvirtd daemon
  virtualisation.libvirtd.enable = true;

  # Enable the Virt-Manager GUI
  programs.virt-manager.enable = true;

  # Install optional but recommended tools for VM management
  environment.systemPackages = with pkgs; [
    virt-viewer
    bridge-utils
  ];
}
