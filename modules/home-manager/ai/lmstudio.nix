{ pkgs, ... }:

{
  home.packages = with pkgs; [ lmstudio ];
  nixpkgs.config.allowUnfree = true;
}
