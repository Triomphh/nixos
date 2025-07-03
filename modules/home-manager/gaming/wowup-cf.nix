{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wowup-cf
  ];

  nixpkgs.config.allowUnfree = true;
}
