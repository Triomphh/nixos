{ pkgs, inputs, ... }:

{
	programs.firefox = {
		enable = true;

		profiles.triomph = {
			
			extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
				darkreader
				ublock-origin
			];

		};
	};
}
