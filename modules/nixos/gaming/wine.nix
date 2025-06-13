{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable    # Wine with both 32-bit and 64-bit support
    winetricks      # Essential Wine configuration tool
  ];
} 