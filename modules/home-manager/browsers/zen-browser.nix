{ pkgs, inputs, ... }:

{
	imports = [
		inputs.zen-browser.homeModules.beta
	];

	programs.zen-browser = {
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
				"browser.startup.page" = 3;	# Open previous windows and tabs on startup

				"signon.rememberSignons" = false;			# Remove Firefox login form autocomplete
				"extensions.formautofill.addresses.enabled"   = false;	# address autocomplete
				"extensions.formautofill.creditCards.enabled" = false;	# credit cards autocomplete

				"extensions.autoDisableScopes" = 0;	# Enable our installed extensions by default, preventing you from having to enable them one by one.

				"browser.translations.neverTranstlateLanguages" = "fr";
			};


			extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
				#betterttv # unfree
				darkreader
				french-dictionary
				return-youtube-dislikes
				proton-pass
				ublock-origin
				youtube-shorts-block
			];

		};

		policies = {
			DisableTelemetry = true;
			DisableFirefoxStudies = true;
			DontCheckDefaultBrowser = true;
			# DefaultDownloadDirectory = "\${home}/Downloads";
			Permissions.Autoplay.Default = "allow-audio-video";
		};
	};
}
