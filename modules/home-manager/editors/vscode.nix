{ lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "vscode" ];

  programs.vscode = {
    enable = true;
    # extensions = with pkgs.vscode-extensions {};
  };
}
