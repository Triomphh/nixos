{ pkgs, ... }:

{
	programs.fish = {
		enable = true;
		
		# Disable greeting
		interactiveShellInit = ''
			set fish_greeting
		'';
	};

	home.packages = [ pkgs.fish ];
}
