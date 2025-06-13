{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hydralauncher
  ];
}
