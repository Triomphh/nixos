{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk21
    maven

    nodejs
    nodePackages.npm
    nodePackages."@angular/cli"
  ];
}
