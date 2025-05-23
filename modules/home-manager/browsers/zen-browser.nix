{ inputs, ... }:

{
	imports = [
		inputs.zen-browser.homeModules.beta
	];

	programs.zen-browser = {
		enable = true;
		
		policies = {
			DisableTelemetry = true;
		};
	};
}
