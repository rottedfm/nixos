{ config, pkgs, ...}:

{
  stylix.enable = true;

  stylix.image = ../../wallpapers/mono.jpg;

  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DajaVu Sans";
    };

    monospace = {
      package = pkgs.hackgen-nf-font;
      name = "Hack GenJyuu Nerd";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
