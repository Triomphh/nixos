{ config, pkgs, inputs, ... }:

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
  	../../modules/home-manager/editors/neovim.nix
  	../../modules/home-manager/tools/git.nix
  ];

  # Git
  programs.git = {
    userName  = "Triomph";
    userEmail = "worker13prime@gmail.com";
    extraConfig.core.editor = "nvim";
  };




  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
