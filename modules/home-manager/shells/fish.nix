{ pkgs, ... }:

{
	programs.fish = {
		enable = true;
	};

	home.packages = [ pkgs.fish ];
}
