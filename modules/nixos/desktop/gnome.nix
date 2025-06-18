{ pkgs, ... }:

{
  # Enable the GNOME Desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # GNOME packages and extensions
  environment.systemPackages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.tiling-shell
  ];

  # GNOME window management settings
  # Add <Super> + right click to resize window
  programs.dconf.profiles.user.databases = [{
    settings = {
      "org/gnome/desktop/wm/preferences" = {
        resize-with-right-button = true;
        mouse-button-modifier = "<Super>";
      };
    };
  }];
} 