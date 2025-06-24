{ lib, ... }:

{
  # GNOME dconf settings via Home Manager for better persistence
  dconf.settings = {
    # Window management settings
    "org/gnome/desktop/wm/preferences" = {
      # Add <Super> + right click to resize window
      resize-with-right-button = true;
      mouse-button-modifier = "<Super>";
    };
    
    # Mouse settings - disable acceleration
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };
    
    # Power management settings - disable sleep and power save features
    "org/gnome/settings-daemon/plugins/power" = {
      # Set power button to power off
      power-button-action = "interactive";
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
      disable-lock-screen = true;
    };
    
    # Disable automatic screen lock
    "org/gnome/desktop/screensaver" = {
      lock-enabled = false;
      lock-delay = lib.gvariant.mkUint32 0;
    };
  };
} 