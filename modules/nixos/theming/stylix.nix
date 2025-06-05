{ inputs, pkgs, ... }:

{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;

    image = ./wallpaper.png;
    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
    };
  };
}
