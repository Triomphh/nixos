{ pkgs, ... }:

{
	programs.git = {
		enable = true;
		settings.init.defaultBranch = "main";
	};


	home.packages = [ pkgs.git ];
}
