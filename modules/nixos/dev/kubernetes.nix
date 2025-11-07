{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kubernetes
    kubectl
  ];
}
