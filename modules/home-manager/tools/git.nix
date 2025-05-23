{ pkgs, ... }:

{
	programs.git = {
		enable = true;

		userName  = "Triomph";
		userEmail = "worker13prime@gmail.com";

		extraConfig = {
			init.defaultBranch = "main";
			# core.editor = "nvim";
		};
	};


	home.packages = [ pkgs.git ];
}
