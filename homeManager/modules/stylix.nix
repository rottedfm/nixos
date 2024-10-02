{ config, pkgs, ... }:

{
  stylix.enable = true;

  stylix.image = ../../wallpapers/ff935eb96a609462a41deac6666c72f1.jpg;
  stylix.polarity = "dark";

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

    sizes = {
      applications = 12;
      terminal = 12;
      desktop = 10;
      popups = 10;
    };
  };

  stylix.cursor.name = "Bibata-Modern-Classic";
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.size = 24;

}
