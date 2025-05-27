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
	services.emacs.startWithUserSession = "graphical";   # Start the daemon after the graphical session
}
