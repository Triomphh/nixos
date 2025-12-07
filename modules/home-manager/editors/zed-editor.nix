{ pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;

    # This populates the userSettings "auto_install_extensions"
    extensions = [ "nix" "toml" "rust" ];

    # Everything inside of these brackets are Zed options
    userSettings = {
      hour_format = "hour24";
      vim_mode = true;

      # Tell Zed to use direnv and direnv can use a flake.nix environment
      load_direnv = "shell_hook";
      base_keymap = "VSCode";

      theme = lib.mkForce {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
    };
  };
}
