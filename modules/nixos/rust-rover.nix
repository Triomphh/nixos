{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.rust-rover
  ];
}
