{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stableFull
    winetricks
  ];
}
