{ pkgs, ... }:

{
	programs.emacs = {
		enable = true;
		package = pkgs.emacs;
	};

	# Starts the Emacs daemon
	services.emacs.enable = true;
}
