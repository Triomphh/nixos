{ inputs, pkgs, ... }:

{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;

    image = ./wallpaper.png;
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      serif = {
        package = pkgs.source-serif;
        name = "Source Serif Pro";
        # package = inputs.apple-fonts.packages.${pkgs.system}.ny-nerd;
        # name = "New York Nerd Font";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
        # package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        # name = "SFProDisplay Nerd Font";
      };
    };
  };
}
