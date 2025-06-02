{ pkgs, ... }:

{
	programs.fish = {
		enable = true;
		
		# Disable greeting
		interactiveShellInit = ''
			set fish_greeting
			fish_vi_key_bindings
		'';
	};

	home.packages = [ pkgs.fish ];
}
