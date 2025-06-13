{ pkgs, ... }:

{
  home.packages = with pkgs; [ windsurf ];
  nixpkgs.config.allowUnfree = true;
}
