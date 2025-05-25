{ pkgs, inputs, ... }:

{
	programs.firefox = {
		enable = true;

		profiles.default = {
			id = 0;
			name = "default";
			isDefault = true;


			search = {
				default        = "ddg";
				privateDefault = "ddg";

				engines = {
					"Nix Packages" = {
						urls = [{
							template = "https://search.nixos.org/packages";
							params = [
								{ name = "type"; value = "packages"; }
								{ name = "query"; value = "{searchTerms}"; }
							];
						}];

						icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
						definedAliases = [ "@nixpkgs" ];
					};
				};
			};	
			search.force = true;


			settings = {
				"browser.search.defaultenginename" = "DuckDuckGo";
				"browser.search.order.1" = "DuckDuckGo";
				"browser.startup.page" = 3; # Open previous windows and tabs on startup
			};


			extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
				#betterttv
				darkreader
				return-youtube-dislikes
				proton-pass
				ublock-origin
			];

		};

		policies = {
			DisableTelemetry = true;
			DisableFirefoxStudies = true;
		};
	};
}
