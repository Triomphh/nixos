{ pkgs, ... }:

{
  # Enable the GNOME Desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Workaround for GNOME autologin:
  # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # GNOME packages and extensions
  environment.systemPackages = with pkgs; [
    gnome-boxes
    gnomeExtensions.user-themes
    gnomeExtensions.tiling-shell
    gnomeExtensions.appindicator
    gnomeExtensions.dual-shock-4-battery-percentage
    gnomeExtensions.transparent-top-bar-adjustable-transparency
    gnomeExtensions.blur-my-shell
  ];

  # Note: dconf settings have been moved to Home Manager for better persistence
  # See modules/home-manager/desktop/gnome.nix
}
