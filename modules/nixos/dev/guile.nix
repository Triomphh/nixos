{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    guile
  ];
} 