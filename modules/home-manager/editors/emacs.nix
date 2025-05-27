{ pkgs, ... }:

{
	programs.emacs = {
		enable = true;
		package = pkgs.emacs;

		extraPackages = epkgs: with epkgs; [
			vterm
		];
	};


	# Starts the Emacs daemon
	services.emacs.enable = true;
}
