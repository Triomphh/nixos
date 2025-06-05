{ pkgs, ... }:

{
  home.packages = with pkgs; [ code-cursor ];
  nixpkgs.config.allowUnfree = true;
}
