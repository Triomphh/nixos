{ pkgs, lib, ... }:

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

  # GNOME window management settings
  programs.dconf.profiles.user.databases = [{
    settings = {
      # Window management settings
      "org/gnome/desktop/wm/preferences" = {
        # Add <Super> + right click to resize window
        resize-with-right-button = true;
        mouse-button-modifier = "<Super>";
      };
      
      # Power management settings - disable sleep and power save features
      "org/gnome/settings-daemon/plugins/power" = {
        # Set power button to power off
        power-button-action = "shutdown";
        # Disable automatic suspend
        sleep-inactive-ac-type = "nothing";
        sleep-inactive-battery-type = "nothing";
        # Disable automatic suspend timeouts
        sleep-inactive-ac-timeout = lib.gvariant.mkUint32 0;
        sleep-inactive-battery-timeout = lib.gvariant.mkUint32 0;
      };
      
      # Disable automatic screen blanking
      "org/gnome/desktop/session" = {
        idle-delay = lib.gvariant.mkUint32 0; # Never blank screen
      };
      
      # Disable automatic screen lock
      "org/gnome/desktop/screensaver" = {
        lock-enabled = false;
        lock-delay = lib.gvariant.mkUint32 0;
      };
      
      # Disable screen lock on suspend (if suspend somehow gets triggered)
      "org/gnome/desktop/session" = {
        disable-lock-screen = true;
      };
    };
  }];
}
