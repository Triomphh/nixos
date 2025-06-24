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
    gnomeExtensions.user-themes
    gnomeExtensions.tiling-shell
  ];

  # Note: dconf settings have been moved to Home Manager for better persistence
  # See modules/home-manager/desktop/gnome.nix
}
