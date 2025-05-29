{ pkgs, ... }:

{
  home.packages = with pkgs; [
    protonup
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPFAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d/";
  };
}
