{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "triomph";
    homeDirectory = "/home/triomph";

    stateVersion = "25.05"; # Inform yourself before changing this

    packages = with pkgs; [
      git
    ];

    file = {};

    sessionVariables = {
      # EDITOR = "emacs";
    };
  };


  imports = [
    ../../modules/home-manager/browsers/zen-browser.nix
    ../../modules/home-manager/browsers/firefox.nix
    ../../modules/home-manager/desktop/gnome.nix
    ../../modules/home-manager/editors/cursor.nix
    ../../modules/home-manager/editors/emacs.nix
    ../../modules/home-manager/editors/neovim.nix
    ../../modules/home-manager/editors/rust-rover.nix
    ../../modules/home-manager/editors/vscode.nix
    ../../modules/home-manager/editors/windsurf.nix
    ../../modules/home-manager/gaming/dolphin-emu.nix
    ../../modules/home-manager/gaming/hydralauncher.nix
    ../../modules/home-manager/gaming/lutris.nix
    ../../modules/home-manager/gaming/prismlauncher.nix
    ../../modules/home-manager/gaming/proton.nix
    ../../modules/home-manager/gaming/vintagestory.nix
    ../../modules/home-manager/gaming/wowup-cf.nix
    ../../modules/home-manager/shells/fish.nix
    ../../modules/home-manager/shells/shell-prompts/starship.nix
    ../../modules/home-manager/terminals/ghostty.nix
    ../../modules/home-manager/terminals/kitty.nix
    ../../modules/home-manager/tools/git.nix
    ../../modules/home-manager/tools/pandoc.nix
  ];

  # Git
  programs.git = {
    userName  = "Triomph";
    userEmail = "worker13prime@gmail.com";
    extraConfig.core.editor = "nvim";
  };


  # XDG user directories
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    extraConfig = {
      XDG_GAMES_DIR = "$HOME/Games";
    };
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
