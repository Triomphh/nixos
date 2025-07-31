{ pkgs, ... }:

{
  # Enable Flatpak
  services.flatpak.enable = true;

  # Install GNOME Software with Flatpak support
  environment.systemPackages = with pkgs; [
    gnome-software
  ];
} 