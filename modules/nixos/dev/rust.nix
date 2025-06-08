{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer
    rustPlatform.rustcSrc
  ];

  environment.variables = {
    RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  };
}
