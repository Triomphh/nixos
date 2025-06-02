{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer
  ];
}
