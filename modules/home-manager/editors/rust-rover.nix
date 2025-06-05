{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.rust-rover
  ];
  
  nixpkgs.config.allowUnfree = true;
} 