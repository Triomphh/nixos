{ lib, ... }:

{
  # GNOME dconf settings via Home Manager for better persistence
  dconf.settings = {
    # GNOME Shell extensions
    "org/gnome/shell" = {
      enabled-extensions = [
        "tilingshell@ferrarodomenico.com"
      ];
    };
    
    # Tiling Shell extension settings
    "org/gnome/shell/extensions/tilingshell" = {
      inner-gaps = lib.gvariant.mkUint32 32;
      outer-gaps = lib.gvariant.mkUint32 32;
      enable-autotiling = true;
      selected-layouts = [["Layout 2"] ["Layout 2"]];
      layouts-json = ''[{"id":"Layout 1","tiles":[{"x":0,"y":0,"width":0.22,"height":0.5,"groups":[1,2]},{"x":0,"y":0.5,"width":0.22,"height":0.5,"groups":[1,2]},{"x":0.22,"y":0,"width":0.56,"height":1,"groups":[2,3]},{"x":0.78,"y":0,"width":0.22,"height":0.5,"groups":[3,4]},{"x":0.78,"y":0.5,"width":0.22,"height":0.5,"groups":[3,4]}]},{"id":"Layout 2","tiles":[{"x":0,"y":0,"width":0.231640625,"height":1,"groups":[1]},{"x":0.231640625,"y":0,"width":0.536718750000001,"height":1,"groups":[2,1]},{"x":0.768359375,"y":0,"width":0.23164062500000004,"height":1,"groups":[2]}]},{"id":"Layout 3","tiles":[{"x":0,"y":0,"width":0.33,"height":1,"groups":[1]},{"x":0.33,"y":0,"width":0.67,"height":1,"groups":[1]}]},{"id":"Layout 4","tiles":[{"x":0,"y":0,"width":0.67,"height":1,"groups":[1]},{"x":0.67,"y":0,"width":0.33,"height":1,"groups":[1]}]}]'';
      move-window-up     = ["<Control><Super>Up"];
      move-window-down   = ["<Control><Super>Down"];
      move-window-left   = ["<Control><Super>Left"];
      move-window-right  = ["<Control><Super>Right"];
      focus-window-up    = ["<Super>Up"];
      focus-window-down  = ["<Super>Down"];
      focus-window-left  = ["<Super>Left"];
      focus-window-right = ["<Super>Right"];
    };
    
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