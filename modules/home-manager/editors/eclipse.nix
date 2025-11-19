{ pkgs, ... }:

{
  home.packages = with pkgs; [
    eclipses.eclipse-modeling
  ];
}
